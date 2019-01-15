----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Saptarshi Mitra
-- 
-- Create Date:    01:03:10 11/16/2018 
-- Design Name: 
-- Module Name:    addop - Behavioral 
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

entity addop is
    Port ( I1 : in  STD_LOGIC_VECTOR(15 downto 0);
           I2 : in  STD_LOGIC_VECTOR(15 downto 0);
           O : out  STD_LOGIC_VECTOR(15 downto 0));
end addop;

architecture Behavioral of addop is

--signal temp : STD_LOGIC_VECTOR (16 downto 0);

begin

	process(I1,I2)
		begin
			O<= I1+I2(15 downto 0);
		end process;


		
--	process(I1,I2)
--	begin
--		temp<= ('0'& I1)+('0' & I2);
--		if (temp > x"ffff") then
--			temp <= temp - x"10000";
--			O <= temp;				
--		else
--			O <= temp;
--		end if;
--	end process;


end Behavioral;

