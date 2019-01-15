--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Saptarshi Mitra
--
-- Create Date:   22:37:27 11/20/2018
-- Design Name:   
-- Module Name:   D:/Masters_Study/1st Sem/VHDL lab/Workspace/submit/direct/tb_trafo.vhd
-- Project Name:  idea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: trafo
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
 
ENTITY tb_trafo IS
END tb_trafo;
 
ARCHITECTURE behavior OF tb_trafo IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT trafo
    PORT(
         X1 : IN  std_logic_vector(15 downto 0);
         X2 : IN  std_logic_vector(15 downto 0);
         X3 : IN  std_logic_vector(15 downto 0);
         X4 : IN  std_logic_vector(15 downto 0);
         Z1 : IN  std_logic_vector(15 downto 0);
         Z2 : IN  std_logic_vector(15 downto 0);
         Z3 : IN  std_logic_vector(15 downto 0);
         Z4 : IN  std_logic_vector(15 downto 0);
         Y1 : OUT  std_logic_vector(15 downto 0);
         Y2 : OUT  std_logic_vector(15 downto 0);
         Y3 : OUT  std_logic_vector(15 downto 0);
         Y4 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal X1 : std_logic_vector(15 downto 0) := (others => '0');
   signal X2 : std_logic_vector(15 downto 0) := (others => '0');
   signal X3 : std_logic_vector(15 downto 0) := (others => '0');
   signal X4 : std_logic_vector(15 downto 0) := (others => '0');
   signal Z1 : std_logic_vector(15 downto 0) := (others => '0');
   signal Z2 : std_logic_vector(15 downto 0) := (others => '0');
   signal Z3 : std_logic_vector(15 downto 0) := (others => '0');
   signal Z4 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Y1 : std_logic_vector(15 downto 0);
   signal Y2 : std_logic_vector(15 downto 0);
   signal Y3 : std_logic_vector(15 downto 0);
   signal Y4 : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: trafo PORT MAP (
          X1 => X1,
          X2 => X2,
          X3 => X3,
          X4 => X4,
          Z1 => Z1,
          Z2 => Z2,
          Z3 => Z3,
          Z4 => Z4,
          Y1 => Y1,
          Y2 => Y2,
          Y3 => Y3,
          Y4 => Y4
        );

   -- Clock process definitions
   process5 :process
   begin
		X1 <= x"0000";
		X2 <= x"0000";
		X3 <= x"0000";
		X4 <= x"0000";
		
		Z1 <= x"0000";
		Z2 <= x"0000";
		Z3 <= x"0000";
		Z4 <= x"0000";
		wait for period/2;
		
		X1 <= x"ffff";
		X2 <= x"0000";
		X3 <= x"0000";
		X4 <= x"0000";
		
		Z1 <= x"0000";
		Z2 <= x"0000";
		Z3 <= x"0000";
		Z4 <= x"0000";
		wait for period/2;
		
		X1 <= x"ffff";
		X2 <= x"aaaa";
		X3 <= x"0000";
		X4 <= x"0000";
		
		Z1 <= x"0000";
		Z2 <= x"0000";
		Z3 <= x"0000";
		Z4 <= x"0000";
		wait for period/2;
		
		X1 <= x"ffff";
		X2 <= x"aaaa";
		X3 <= x"5555";
		X4 <= x"0000";
		
		Z1 <= x"0000";
		Z2 <= x"0000";
		Z3 <= x"0000";
		Z4 <= x"0000";
		wait for period/2;
		
		X1 <= x"ffff";
		X2 <= x"aaaa";
		X3 <= x"5555";
		X4 <= x"2492";
		
		Z1 <= x"0000";
		Z2 <= x"0000";
		Z3 <= x"0000";
		Z4 <= x"0000";
		wait for period/2;
		
		X1 <= x"ffff";
		X2 <= x"aaaa";
		X3 <= x"5555";
		X4 <= x"2492";
		
		Z1 <= x"db6d";
		Z2 <= x"0000";
		Z3 <= x"0000";
		Z4 <= x"0000";
		wait for period/2;
		
		X1 <= x"ffff";
		X2 <= x"aaaa";
		X3 <= x"5555";
		X4 <= x"2492";
		
		Z1 <= x"db6d";
		Z2 <= x"1c71";
		Z3 <= x"0000";
		Z4 <= x"0000";
		wait for period/2;
		
		X1 <= x"ffff";
		X2 <= x"aaaa";
		X3 <= x"5555";
		X4 <= x"2492";
		
		Z1 <= x"db6d";
		Z2 <= x"1c71";
		Z3 <= x"cccc";
		Z4 <= x"0000";
		wait for period/2;
		
		X1 <= x"ffff";
		X2 <= x"aaaa";
		X3 <= x"5555";
		X4 <= x"2492";
		
		Z1 <= x"db6d";
		Z2 <= x"1c71";
		Z3 <= x"cccc";
		Z4 <= x"0002";
		wait for period/2;
		
   end process;
 

   

END;
