----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    roundcounter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity roundcounter is
    Port ( CLK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           RESULT : in  STD_LOGIC;
           READY : out  STD_LOGIC;
           S_i : out  STD_LOGIC;
           INIT : out  STD_LOGIC;
           TRAFO : out  STD_LOGIC;
           ROUND : out  STD_LOGIC_VECTOR (3 downto 0));
end roundcounter;

architecture Behavioral of roundcounter is

type STATE_TYPE is (sleep, setup, calc);--for 1st state machine, here are the name of the states
signal CURRENT_STATE, NEXT_STATE:STATE_TYPE:=sleep;--for 1st state machine, this is for moving forward through states
signal cin : std_logic_vector(3 downto 0) :="1000"; --this is for the second state machine which is only calculating the round number

begin

round_internal: process(CLK)--2nd state machine, internal counter,fig 42, only gives cin=the count value of rounds
	begin
			if(rising_edge(CLK)) then
				if(cin/="1000") then
					if(RESULT = '1') then
						cin <= cin + 1;
					else
						cin <= cin;
					end if;
					
				elsif(cin = "1000") then
					if(START = '1') then
						cin <= "0000";
					else
						cin <= "1000";
					end if;
				end if;
			
			end if;
		
		
	end process;
	
	
state_reg: process(CLK)--1st state machine (1st part). This is the format to follow. avoid structure like above(complicated)
	begin
		if (rising_edge(CLK)) then
			 CURRENT_STATE <= NEXT_STATE;
		end if;
	end process;
	

comb_logic: process(CURRENT_STATE, START, RESULT, cin)
	begin
		case CURRENT_STATE is
			when sleep =>
				INIT <='0';
				READY <= '1';
				if (START = '1') then
					NEXT_STATE <= setup;
				else
					NEXT_STATE <= sleep;
				end if;
				
			when setup =>
				INIT <= '1';
				READY <= '0';	
				NEXT_STATE <= calc;
				
			when calc =>
				INIT <= '0';
				READY <= '0';	
				
				if (RESULT = '0') then
					NEXT_STATE <= calc;
				elsif (RESULT = '1' and cin = "1000") then
					next_state <= sleep;
				else
					next_state <= setup;
				end if;
		end case;
		
		if (cin = "0000") then
			S_i <= '1';
		else
			S_i <= '0';
		end if;
		
	end process;
	
	TRAFO <= cin(3);--MSB of counter value defines TRAFO, means only in 1000, out transformation gets enabled
	ROUND <= cin;	
	
	
end Behavioral;

