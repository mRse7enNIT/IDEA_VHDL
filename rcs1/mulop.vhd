----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Saptarshi Mitra
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    mulop - Behavioral 
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mulop is
    Port ( I_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           I_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           O_1 : out  STD_LOGIC_VECTOR (15 downto 0));
end mulop;

architecture Behavioral of mulop is
signal temp1 : STD_LOGIC_VECTOR (16 downto 0);
signal temp2 : STD_LOGIC_VECTOR (16 downto 0);
signal temp3 : STD_LOGIC_VECTOR (33 downto 0);--be careful, ask questions
signal temp4 : STD_LOGIC_VECTOR (16 downto 0);
signal temp5 : STD_LOGIC_VECTOR (16 downto 0);
signal temp6 : STD_LOGIC_VECTOR (16 downto 0);
signal modular : STD_LOGIC_VECTOR (15 downto 0);
signal quotient : STD_LOGIC_VECTOR (16 downto 0);
begin
	zerocheck: process(I_1,I_2)
		begin
			temp1 <= '0' & I_1;
			temp2 <= '0' & I_2;
			if (I_1 = x"0000") then
				temp1 <= "10000000000000000";
			end if;
			if (I_2 = x"0000") then
				temp2 <= "10000000000000000";
			end if;
		end process;
			temp3 <= temp1*temp2;
			modular <= temp3(15 downto 0);
			quotient <= temp3(32 downto 16);
			--temp4 <= ('0' & modular)-quotient;
			
	finalout: process(modular,quotient)
		begin	
			if (modular >= quotient) then
				temp4 <= ('0' & modular)-quotient;
				--O_1<= temp4(15 downto 0);
			else
				temp4 <= ('0' & modular)-quotient+"10000000000000001";				
				--temp6 <= quotient-('0' & modular);
				--temp5 <= "10000000000000000"+"1"-temp6;
				--O_1<= temp5(15 downto 0);
			end if;
			
		end process;

	O_1<= temp4(15 downto 0);

end Behavioral;

