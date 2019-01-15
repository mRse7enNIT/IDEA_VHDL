--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Saptarshi Mitra
--
-- Create Date:   02:52:30 12/07/2018
-- Design Name:   
-- Module Name:   D:/Masters_Study/1st Sem/VHDL lab/Workspace/submit/rcs1/tb_register_16.vhd
-- Project Name:  idea_rcs1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: register_16
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
 
ENTITY tb_register_16 IS
END tb_register_16;
 
ARCHITECTURE behavior OF tb_register_16 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register_16
    PORT(
         CLK : IN  std_logic;
         EN : IN  std_logic;
         D : IN  std_logic_vector(15 downto 0);
         Q : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal EN : std_logic := '0';
   signal D : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Q : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register_16 PORT MAP (
          CLK => CLK,
          EN => EN,
          D => D,
          Q => Q
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
		D <= x"ABCD";
		EN <= '0';
		
      wait for 100 ns;	
		
		EN <= '1';
		
      wait for CLK_period*10;

      -- insert stimulus here 
		D <= x"1234";
		EN <= '0';
		
      wait for CLK_period*10;
		
		EN <= '1';
		
		wait for CLK_period*10;
		
   end process;

END;
