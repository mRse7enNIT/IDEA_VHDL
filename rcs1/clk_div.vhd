----------------------------------------------------------------------------------
-- TUM
-- Engineer: Martin Strasser, Ning Chen
-- 
-- Create Date:    09:38:04 05/29/2008 
-- Design Name: 
-- Module Name:    clk_div - Behavioral 
-- Project Name:   idea lab
-- Target Devices: Spartan 3E
-- Tool versions:  > 9.2
-- Description:    This is the clock generator.
--                 It takes the 50MHz on-board clock and devides it
--                 by a factor to get the frequency 16*19200 Hz,
--                 which is needed for the UART.
--
-- Dependencies: 
--
-- Revision 1.00 - File created and tested
-- Revision 2.00 - Changed baud rate to 19200
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clk_div is
    Port ( CLK : in  STD_LOGIC;
           CLK_OUT : out  STD_LOGIC);
end clk_div;

architecture Behavioral of clk_div is
signal counter : INTEGER := 0;
begin
	process(CLK)
	begin
		if ( CLK'event and CLK = '1' ) then
			counter<=counter+1;
			if ( counter < 81 ) then
				CLK_OUT <= '0';
			elsif ( counter < 162 ) then
				CLK_OUT <= '1';
			else
				counter <= 0;
			end if;
		end if;
	end process;
end Behavioral;

