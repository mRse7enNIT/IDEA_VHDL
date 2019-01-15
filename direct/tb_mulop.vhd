--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Saptarshi Mitra
--
-- Create Date:   00:16:36 11/20/2018
-- Design Name:   
-- Module Name:   D:/Masters_Study/1st Sem/VHDL lab/Workspace/submit/direct/tb_mulop.vhd
-- Project Name:  idea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mulop
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_mulop IS
END tb_mulop;
 
ARCHITECTURE behavior OF tb_mulop IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mulop
    PORT(
         I_1 : IN  std_logic_vector(15 downto 0);
         I_2 : IN  std_logic_vector(15 downto 0);
         O_1 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I_1 : std_logic_vector(15 downto 0) := (others => '0');
   signal I_2 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal O_1 : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mulop PORT MAP (
          I_1 => I_1,
          I_2 => I_2,
          O_1 => O_1
        );

   -- Clock process definitions
   process3 :process
   begin
		I_1 <= x"0000";
		I_2 <= x"0000";
		wait for period/2;
		I_1 <= x"0001";
		I_2 <= x"0000";
		wait for period/2;
		I_1 <= x"0001";
		I_2 <= x"0001";
		wait for period/2;
		I_1 <= x"0003";
		I_2 <= x"0001";
		wait for period/2;
		I_1 <= x"0003";
		I_2 <= x"0003";
		wait for period/2;
		I_1 <= x"7fff";
		I_2 <= x"0003";
		wait for period/2;
		I_1 <= x"7fff";
		I_2 <= x"7fff";
		wait for period/2;
		I_1 <= x"ffff";
		I_2 <= x"7fff";
		wait for period/2;
		I_1 <= x"ffff";
		I_2 <= x"ffff";
		wait for period/2;
		I_1 <= x"8000";
		I_2 <= x"ffff";
		wait for period/2;
		I_1 <= x"8000";
		I_2 <= x"8000";
		wait for period/2;
   end process;
 

   

END;
