--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Saptarshi Mitra
--
-- Create Date:   13:18:39 11/12/2018
-- Design Name:   
-- Module Name:   D:/Masters_Study/1st Sem/VHDL lab/Workspace/submit/direct/tb_xorop.vhd
-- Project Name:  idea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: xorop
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
 
ENTITY tb_xorop IS
END tb_xorop;
 
ARCHITECTURE behavior OF tb_xorop IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT xorop
    PORT(
         I1	 : in  std_logic_vector(15 downto 0);
         I2 : in  std_logic_vector(15 downto 0);
         O : out  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    
	
   --Inputs and Outputs
   signal I1, I2, O : std_logic_vector (15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant I1_period : time := 10 ns;
--	constant I2_period : time := 20 ns;
	constant period : time := 10 ns;
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: xorop PORT MAP (
          I1 => I1,
          I2 => I2,
          O => O
        );

   -- Clock process definitions
   process1 :process
   begin
		I1 <=  x"0000";
		I2 <=  x"0000";
		wait for period/2;
		I1 <=  x"1234";
		I2 <=  x"5678";
		wait for period/2;
		I1 <=  x"1234";
		I2 <=  x"0000";
		wait for period/2;
   end process;
	
	

END;
