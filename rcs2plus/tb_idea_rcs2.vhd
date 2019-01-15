--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:59:14 01/14/2019
-- Design Name:   
-- Module Name:   D:/Masters_Study/1st Sem/VHDL lab/Workspace/submit/rcs2/tb_idea_rcs2.vhd
-- Project Name:  idea_rcs2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: idea_rcs2
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
 
ENTITY tb_idea_rcs2 IS
END tb_idea_rcs2;
 
ARCHITECTURE behavior OF tb_idea_rcs2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT idea_rcs2
    PORT(
         CLOCK : IN  std_logic;
         START : IN  std_logic;
         KEY : IN  std_logic_vector(127 downto 0);
         X_1 : IN  std_logic_vector(15 downto 0);
         X_2 : IN  std_logic_vector(15 downto 0);
         X_3 : IN  std_logic_vector(15 downto 0);
         X_4 : IN  std_logic_vector(15 downto 0);
         Y_1 : OUT  std_logic_vector(15 downto 0);
         Y_2 : OUT  std_logic_vector(15 downto 0);
         Y_3 : OUT  std_logic_vector(15 downto 0);
         Y_4 : OUT  std_logic_vector(15 downto 0);
         READY : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLOCK : std_logic := '0';
   signal START : std_logic := '0';
   signal KEY : std_logic_vector(127 downto 0) := (others => '0');
   signal X_1 : std_logic_vector(15 downto 0) := (others => '0');
   signal X_2 : std_logic_vector(15 downto 0) := (others => '0');
   signal X_3 : std_logic_vector(15 downto 0) := (others => '0');
   signal X_4 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Y_1 : std_logic_vector(15 downto 0);
   signal Y_2 : std_logic_vector(15 downto 0);
   signal Y_3 : std_logic_vector(15 downto 0);
   signal Y_4 : std_logic_vector(15 downto 0);
   signal READY : std_logic;

   -- Clock period definitions
   constant CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: idea_rcs2 PORT MAP (
          CLOCK => CLOCK,
          START => START,
          KEY => KEY,
          X_1 => X_1,
          X_2 => X_2,
          X_3 => X_3,
          X_4 => X_4,
          Y_1 => Y_1,
          Y_2 => Y_2,
          Y_3 => Y_3,
          Y_4 => Y_4,
          READY => READY
        );

   -- Clock process definitions
   CLOCK_process :process
   begin
		CLOCK <= '0';
		wait for CLOCK_period/2;
		CLOCK <= '1';
		wait for CLOCK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      START <= '0';
		wait for 100 ns;	

				
		X_1 <= x"1111";
		X_2 <= x"2222";
		X_3 <= x"4444";
		X_4 <= x"8888";
		KEY <= x"00010002000300040005000600070008";
		
		START <= '1';
		wait for CLOCK_period;
		START <= '0';
		wait for CLOCK_period*100;	

		X_1 <= x"0000";
		X_2 <= x"0000";
		X_3 <= x"0000";
		X_4 <= x"0000";
		KEY <= x"00000000000000000000000000000000";
		wait for 100 ns;
				
		START <= '1';
		wait for CLOCK_period;
		START <= '0';
		wait for CLOCK_period*100;	

		X_1 <= x"0000";
		X_2 <= x"0001";
		X_3 <= x"0002";
		X_4 <= x"0003";
		KEY <= x"00010002000300040005000600070008";
		wait for 100 ns;
				
		START <= '1';
		wait for CLOCK_period;
		START <= '0';
		wait for CLOCK_period*100;
   end process;

END;
