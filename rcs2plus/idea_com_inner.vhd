----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Martin Strasser, Ning Chen
-- 
-- Create Date:    20:59:47 06/19/2008 
-- Design Name: 
-- Module Name:    idea_com_inner - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 1.00 - File Created
-- Revision 2.00 (nnc) - Key can be programmed
-- Revision 2.01 (nnc) - Add loopback mode for cable testing

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity idea_com_inner is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           RxD : in  STD_LOGIC;
           TxD : out  STD_LOGIC;
           LEDs : out  STD_LOGIC_VECTOR (7 downto 0));
end idea_com_inner;

architecture Behavioral of idea_com_inner is

-- The UART for the communication with the PC:
component uart
	port ( mclkx16 	: in STD_LOGIC;
          reset 		: in STD_LOGIC;
          read 		: in STD_LOGIC;
          write 		: in STD_LOGIC;
          --data 		: inout STD_LOGIC_VECTOR (7 downto 0);
			 rxdata 		: out STD_LOGIC_VECTOR (7 downto 0);
		    txdata 		: in STD_LOGIC_VECTOR (7 downto 0);
          sin 		: in STD_LOGIC;
          sout 		: out STD_LOGIC;
          rxrdy 		: out STD_LOGIC;
          txrdy 		: out STD_LOGIC;
          parity_error 	: out STD_LOGIC;
          framing_error 	: out STD_LOGIC;
          overrun 	: out STD_LOGIC );
end component;

component idea_rcs2plus 
    Port ( CLOCK : in STD_LOGIC;
	   START : in  STD_LOGIC;
           READY : out  STD_LOGIC;			  
           KEY : in  STD_LOGIC_VECTOR (127 downto 0);
           X_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Y_1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_4 : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component mux2x1 is
    Port ( D0 : in  STD_LOGIC_VECTOR (15 downto 0);
           D1 : in  STD_LOGIC_VECTOR (15 downto 0);
           S : in  STD_LOGIC;
           O : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

-- All used signals for the top level are defined here:

signal read : STD_LOGIC := '1';
signal write : STD_LOGIC := '1';
signal rxrdy, txrdy : STD_LOGIC := '1';
signal parity_error, framing_error, overrun : STD_LOGIC := '0';
signal data : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
signal txdata : STD_LOGIC_VECTOR(7 downto 0) := "00000000";

signal start_idea, ready_idea : STD_LOGIC := '0';

signal x1, x2, x3, x4 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
signal y1, y2, y3, y4 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
signal key : STD_logic_vector (127 downto 0) := x"00000000000000000000000000000000";

type STATE_TYPE is ( IDLE, WAIT_FOR_DATA, RECEIVED_BYTE, READ_BYTE,
						   WAIT_FOR_RXRDY_0, WAIT_FOR_IDEA_TO_DEACTIVATE_READY,
							WAIT_FOR_IDEA_TO_COMPLETE,
							WRITE_BYTE, WRITE_BYTE_NOW, WRITE_BYTE_ACK,
							WAIT_FOR_TXRDY_1, LOOPBACK_MODE );


signal state : STATE_TYPE := IDLE;
signal byte_cntr : std_logic_vector(4 downto 0) := "00000";

signal loopback_select : std_logic := '0';
signal z1, z2, z3, z4 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";

begin	
	-- The UART module
	uart1:   uart port map( Clk, Reset,
									read, write, data, txdata,
									RxD, TxD,
									rxrdy, txrdy,
									parity_error, framing_error, overrun );
	-- The encryption algorithm
	idea1:   idea_rcs2plus port map( clk, start_idea, ready_idea, key, x1, x2, x3, x4, y1, y2, y3, y4);
	
	-- mux for loopback mode
	mux1 : mux2x1 port map(
		D0 => y1,
		D1 => x1,
		S => loopback_select,
		O => z1);		
	mux2 : mux2x1 port map(
		D0 => y2,
		D1 => x2,
		S => loopback_select,
		O => z2);		
	mux3 : mux2x1 port map(
		D0 => y3,
		D1 => X3,
		S => loopback_select,
		O => z3);		
	mux4 : mux2x1 port map(
		D0 => y4,
		D1 => X4,
		S => loopback_select,
		O => z4);
	
	-- The state machine for the communication:
	process ( Clk )
	begin
		if ( Clk'event and Clk='1' ) then
			if ( Reset = '1' ) then
				state <= IDLE;
				byte_cntr <= "00000";
				read <= '1';
				write <= '1';
				LEDs <= "00000000";
			else
				if ( state = IDLE ) then
					-- Initial state
					state <= WAIT_FOR_DATA;
					byte_cntr <= "00000";
				elsif ( state = WAIT_FOR_DATA ) then
					write <= '1';
					-- Waiting for incoming data.
					if ( rxrdy = '1' ) then
						-- There is a byte at the receiver!
						state <= RECEIVED_BYTE;
					end if;
				elsif ( state = RECEIVED_BYTE ) then
					-- The UART signalizes, that there
					-- is a new byte to be read!
					read <= '0';
					LEDs(3) <= '0';
					state <= READ_BYTE;
				elsif ( state = READ_BYTE ) then
					-- Read the byte and set the
					-- right input registers of the
					-- IDEA block.
					LEDs(0) <= framing_error;
					LEDs(1) <= parity_error;
					LEDs(2) <= overrun;
					byte_cntr <= byte_cntr+"00001";
					if ( byte_cntr = "00000" ) then
						x1(7 downto 0) <= data;
					elsif ( byte_cntr = "00001" ) then
						x1(15 downto 8) <= data;
					elsif ( byte_cntr = "00010" ) then
						x2(7 downto 0) <= data;
					elsif ( byte_cntr = "00011" ) then
						x2(15 downto 8) <= data;
					elsif ( byte_cntr = "00100" ) then
						x3(7 downto 0) <= data;
					elsif ( byte_cntr = "00101" ) then
						x3(15 downto 8) <= data;
					elsif ( byte_cntr = "00110" ) then
						x4(7 downto 0) <= data;
					elsif ( byte_cntr = "00111" ) then
						x4(15 downto 8) <= data;
					elsif ( byte_cntr = "01000" ) then
						key(7 downto 0) <= data;
					elsif ( byte_cntr = "01001" ) then
						key(15 downto 8) <= data;
					elsif ( byte_cntr = "01010" ) then
						key(23 downto 16) <= data;
					elsif ( byte_cntr = "01011" ) then
						key(31 downto 24) <= data;
					elsif ( byte_cntr = "01100" ) then
						key(39 downto 32) <= data;
					elsif ( byte_cntr = "01101" ) then
						key(47 downto 40) <= data;						
					elsif ( byte_cntr = "01110" ) then
						key(55 downto 48) <= data;
					elsif ( byte_cntr = "01111" ) then
						key(63 downto 56) <= data;
					elsif ( byte_cntr = "10000" ) then
						key(71 downto 64) <= data;
					elsif ( byte_cntr = "10001" ) then
						key(79 downto 72) <= data;
					elsif ( byte_cntr = "10010" ) then
						key(87 downto 80) <= data;
					elsif ( byte_cntr = "10011" ) then
						key(95 downto 88) <= data;
					elsif ( byte_cntr = "10100" ) then
						key(103 downto 96) <= data;
					elsif ( byte_cntr = "10101" ) then
						key(111 downto 104) <= data;
					elsif ( byte_cntr = "10110" ) then
						key(119 downto 112) <= data;
					elsif ( byte_cntr = "10111" ) then
						key(127 downto 120) <= data;									
					end if;
					read <= '1';
					state <= WAIT_FOR_RXRDY_0;
				elsif ( state = WAIT_FOR_RXRDY_0 ) then
					-- Wait until the UART has acknowledged
					-- that the data has been read.
					if ( rxrdy = '0' ) then
						if ( byte_cntr = "11000" ) then
						   -- add loopback mode
							if (key = X"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF") then
								state <= LOOPBACK_MODE;
								loopback_select <= '1';
							else							
								start_idea <= '1';
								state <= WAIT_FOR_IDEA_TO_DEACTIVATE_READY;
								loopback_select <= '0';
							end if;	
							
							-- added newly: 20130405
--							read <= '1';
							
						else
							state <= WAIT_FOR_DATA;
						end if;
					end if;
				elsif(state=LOOPBACK_MODE) then
					byte_cntr <= "00000";
					state <= WRITE_BYTE;
				elsif ( state = WAIT_FOR_IDEA_TO_DEACTIVATE_READY ) then
					if ( ready_idea = '0' ) then
						state <= WAIT_FOR_IDEA_TO_COMPLETE;
					end if;
				elsif ( state = WAIT_FOR_IDEA_TO_COMPLETE ) then
					-- The IDEA algorithm has computed its results now.
					byte_cntr <= "00000";
					start_idea <= '0';
					if ( ready_idea = '1' ) then			
						state <= WRITE_BYTE;
					end if;
				elsif ( state = WRITE_BYTE ) then					
					-- Write back the computed data set
					byte_cntr <= byte_cntr + "00001";
					if ( byte_cntr = "00000" ) then
						txdata <= z1(7 downto 0);
					elsif ( byte_cntr = 1 ) then
						txdata <= z1(15 downto 8);						
					elsif ( byte_cntr = 2 ) then
						txdata <= z2(7 downto 0);
					elsif ( byte_cntr = 3 ) then
						txdata <= z2(15 downto 8);
					elsif ( byte_cntr = 4 ) then
						txdata <= z3(7 downto 0);
					elsif ( byte_cntr = 5 ) then
						txdata <= z3(15 downto 8);
					elsif ( byte_cntr = 6 ) then
						txdata <= z4(7 downto 0);
					elsif ( byte_cntr = 7 ) then
						txdata <= z4(15 downto 8);
					end if;
					state <= WRITE_BYTE_NOW;
				elsif ( state = WRITE_BYTE_NOW ) then
					write <= '0';
					state <= WRITE_BYTE_ACK;
				elsif ( state = WRITE_BYTE_ACK ) then
					write <= '1';
					if ( txrdy = '0' ) then
						state <= WAIT_FOR_TXRDY_1;
					end if;
				elsif ( state = WAIT_FOR_TXRDY_1 ) then
					if ( txrdy = '1' ) then
						txdata <= "00000000";
						if ( byte_cntr = "01000" ) then
							state <= WAIT_FOR_DATA;
							byte_cntr <= "00000";
							LEDs(3) <= '1';
						else
							state <= WRITE_BYTE;
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;
	
end Behavioral;

