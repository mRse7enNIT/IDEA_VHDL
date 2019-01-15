----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:31:36 11/20/2018 
-- Design Name: 
-- Module Name:    round - Behavioral 
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

entity round is
    Port ( X1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z2 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z3 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z5 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z6 : in  STD_LOGIC_VECTOR (15 downto 0);
           Y1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y4 : out  STD_LOGIC_VECTOR (15 downto 0));
end round;

architecture Behavioral of round is

COMPONENT mulop
    PORT(
         I_1 : IN  std_logic_vector(15 downto 0);
         I_2 : IN  std_logic_vector(15 downto 0);
         O_1 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;

COMPONENT xorop
    PORT(
         I1	 : in  std_logic_vector(15 downto 0);
         I2 : in  std_logic_vector(15 downto 0);
         O : out  std_logic_vector(15 downto 0)
        );
    END COMPONENT;

COMPONENT addop
    PORT(
         I1 : IN  std_logic_vector(15 downto 0);
         I2 : IN  std_logic_vector(15 downto 0);
         O : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
	 
signal N1, N2, N3, N4, N5, N6, N7, N8, N9, N10 : std_logic_vector(15 downto 0);
begin
	m1: mulop PORT MAP (
          I_1 => X1,
          I_2 => Z1,
          O_1 => N1--this is node 1
        );
	a1: addop PORT MAP (
          I1 => X2,
          I2 => Z2,
          O => N2--this is node 2
        );
	a2: addop PORT MAP (
          I1 => X3,
          I2 => Z3,
          O => N3--this is node 3
        );
	m2: mulop PORT MAP (
          I_1 => X4,
          I_2 => Z4,
          O_1 => N4--this is node 4
        );
	xor_1: xorop PORT MAP (
          I1 => N1,
          I2 => N3,
          O => N5--this is node 5
        );
	xor_2: xorop PORT MAP (
          I1 => N2,
          I2 => N4,
          O => N6--this is node 6
        );
	m3: mulop PORT MAP (
          I_1 => N5,
          I_2 => Z5,
          O_1 => N7--this is node 7
        );
	a3: addop PORT MAP (
          I1 => N6,
          I2 => N7,
          O => N8--this is node 1
        );
	m4: mulop PORT MAP (
          I_1 => N8,
          I_2 => Z6,
          O_1 => N9--this is node 9
        );
	a4: addop PORT MAP (
          I1 => N7,
          I2 => N9,
          O => N10--this is node 10
        );
	xor_3: xorop PORT MAP (
          I1 => N1,
          I2 => N9,
          O => Y1--this is output 1
        );
	xor_4: xorop PORT MAP (
          I1 => N3,
          I2 => N9,
          O => Y2--this is output 2
        );
	xor_5: xorop PORT MAP (
          I1 => N2,
          I2 => N10,
          O => Y3--this is output 3
        );
	xor_6: xorop PORT MAP (
          I1 => N4,
          I2 => N10,
          O => Y4--this is output 4
        );



end Behavioral;

