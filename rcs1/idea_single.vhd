----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Saptarshi Mitra
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    idea_single - Structural 
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

entity idea_single is
    Port ( CLOCK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           KEY : in  STD_LOGIC_VECTOR (127 downto 0);
           X_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Y_1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_4 : out  STD_LOGIC_VECTOR (15 downto 0);
           READY : out  STD_LOGIC);
end idea_single;

architecture Structural of idea_single is

    COMPONENT round
    PORT(
         X1 : IN  std_logic_vector(15 downto 0);
         X2 : IN  std_logic_vector(15 downto 0);
         X3 : IN  std_logic_vector(15 downto 0);
         X4 : IN  std_logic_vector(15 downto 0);
         Z1 : IN  std_logic_vector(15 downto 0);
         Z2 : IN  std_logic_vector(15 downto 0);
         Z3 : IN  std_logic_vector(15 downto 0);
         Z4 : IN  std_logic_vector(15 downto 0);
         Z5 : IN  std_logic_vector(15 downto 0);
         Z6 : IN  std_logic_vector(15 downto 0);
         Y1 : OUT  std_logic_vector(15 downto 0);
         Y2 : OUT  std_logic_vector(15 downto 0);
         Y3 : OUT  std_logic_vector(15 downto 0);
         Y4 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    
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
	 
	 COMPONENT register_16
    PORT(
         CLK : IN  std_logic;
         EN : IN  std_logic;
         D : IN  std_logic_vector(15 downto 0);
         Q : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT mux2x1
    PORT(
         D0 : IN  std_logic_vector(15 downto 0);
         D1 : IN  std_logic_vector(15 downto 0);
         S : IN  std_logic;
         O : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT keygen
    PORT(
         KEY : IN  std_logic_vector(127 downto 0);
         ROUND : IN  std_logic_vector(3 downto 0);
         KEY1 : OUT  std_logic_vector(15 downto 0);
         KEY2 : OUT  std_logic_vector(15 downto 0);
         KEY3 : OUT  std_logic_vector(15 downto 0);
         KEY4 : OUT  std_logic_vector(15 downto 0);
         KEY5 : OUT  std_logic_vector(15 downto 0);
         KEY6 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT control
    PORT(
         CLK : IN  std_logic;
         START : IN  std_logic;
         ROUND : OUT  std_logic_vector(3 downto 0);
         READY : OUT  std_logic;
         EN : OUT  std_logic;
         S : OUT  std_logic
        );
    END COMPONENT;
    
	 signal m1,m2,m3,m4: std_logic_vector(15 downto 0);--output of register
	 signal ri1,ri2, ri3, ri4: std_logic_vector(15 downto 0); --register input
	 signal ro1,ro2, ro3, ro4: std_logic_vector(15 downto 0); --register output
	 signal par_key1, par_key2, par_key3, par_key4, par_key5, par_key6: std_logic_vector(15 downto 0);-- partial key outputs from keygen
	 signal rnd: std_logic_vector(3 downto 0);
	 signal en, S: std_logic;
	 
	 
begin


	mux1: mux2x1 PORT MAP (
          D0 => X_1,
          D1 => ro1,
          S => S,
          O => m1
        );
		  
   mux2: mux2x1 PORT MAP (
          D0 => X_2,
          D1 => ro2,
          S => S,
          O => m2
        );

   mux3: mux2x1 PORT MAP (
          D0 => X_3,
          D1 => ro3,
          S => S,
          O => m3
        );

   mux4: mux2x1 PORT MAP (
          D0 => X_4,
          D1 => ro4,
          S => S,
          O => m4
        );		  
		  
	round1: round PORT MAP (
				 X1 => m1,
				 X2 => m2,
				 X3 => m3,
				 X4 => m4,
				 Z1 => par_key1,
				 Z2 => par_key2,
				 Z3 => par_key3,
				 Z4 => par_key4,
				 Z5 => par_key5,
				 Z6 => par_key6,
				 Y1 => ri1,
				 Y2 => ri2,
				 Y3 => ri3,
				 Y4 => ri4
			  );

	reg1: register_16 PORT MAP (
          CLK => CLOCK,
          EN => en,
          D => ri1,
          Q => ro1
        );

   reg2: register_16 PORT MAP (
          CLK => CLOCK,
          EN => en,
          D => ri2,
          Q => ro2
        );

   reg3: register_16 PORT MAP (
          CLK => CLOCK,
          EN => en,
          D => ri3,
          Q => ro3
        );

   reg4: register_16 PORT MAP (
          CLK => CLOCK,
          EN => en,
          D => ri4,
          Q => ro4
        );	
		  
	out_traf: trafo PORT MAP (
          X1 => ro1,
          X2 => ro2,
          X3 => ro3,
          X4 => ro4,
          Z1 => par_key1,
          Z2 => par_key2,
          Z3 => par_key3,
          Z4 => par_key4,
          Y1 => Y_1,
          Y2 => Y_2,
          Y3 => Y_3,
          Y4 => Y_4
        );		  
		  
   control_unit: control PORT MAP (
          CLK => CLOCK,
          START => START,
          ROUND => rnd,
          READY => READY,
          EN => en,
          S => S
        );
		  
   key_gen: keygen PORT MAP (
          KEY => KEY,
          ROUND => rnd,
          KEY1 => par_key1,
          KEY2 => par_key2,
          KEY3 => par_key3,
          KEY4 => par_key4,
          KEY5 => par_key5,
          KEY6 => par_key6
        );		  
		  
		  

end Structural;

