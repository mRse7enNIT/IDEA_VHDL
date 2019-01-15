----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Saptarshi Mitra
-- 
-- Create Date:    16:22:30 12/07/2018 
-- Design Name: 
-- Module Name:    keygen - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity keygen is
    Port ( KEY : in  STD_LOGIC_VECTOR (127 downto 0);
           ROUND : in  STD_LOGIC_VECTOR (3 downto 0);
           KEY1 : out  STD_LOGIC_VECTOR (15 downto 0);
           KEY2 : out  STD_LOGIC_VECTOR (15 downto 0);
           KEY3 : out  STD_LOGIC_VECTOR (15 downto 0);
           KEY4 : out  STD_LOGIC_VECTOR (15 downto 0);
           KEY5 : out  STD_LOGIC_VECTOR (15 downto 0);
           KEY6 : out  STD_LOGIC_VECTOR (15 downto 0));
end keygen;

architecture Behavioral of keygen is

signal SELECTED_KEY: std_logic_vector (95 downto 0);

begin



	process (ROUND)
	begin
		case ROUND is
			when "0000" => SELECTED_KEY <= KEY(127 downto 32);
			when "0001" => SELECTED_KEY <= KEY(31 downto 0) & KEY(102 downto 39);
			when "0010" => SELECTED_KEY <= KEY(38 downto 0) & KEY(127 downto 103) & KEY(77 downto 46);
			when "0011" => SELECTED_KEY <= KEY(45 downto 0) & KEY(127 downto 78);
			when "0100" => SELECTED_KEY <= KEY(52 downto 0) & KEY(127 downto 85);
			when "0101" => SELECTED_KEY <= KEY(84 downto 53) & KEY(27 downto 0) & KEY(127 downto 92);
			when "0110" => SELECTED_KEY <= KEY(91 downto 28) & KEY(2 downto 0) & KEY(127 downto 99);
			when "0111" => SELECTED_KEY <= KEY(98 downto 3);
			when "1000" => SELECTED_KEY <= KEY(105 downto 42) & x"00000000"; --64 bits + 8*4 bits= 96 bits key to maintain no error
			when others => SELECTED_KEY <= x"000000000000000000000000";
		end case;
	end process;

	KEY1 <= SELECTED_KEY(95 downto 80); -- these are the 6 keys of total 96 bits, seperate keys for operations
	KEY2 <= SELECTED_KEY(79 downto 64);
	KEY3 <= SELECTED_KEY(63 downto 48);
	KEY4 <= SELECTED_KEY(47 downto 32);
	KEY5 <= SELECTED_KEY(31 downto 16);
	KEY6 <= SELECTED_KEY(15 downto 0);



end Behavioral;

