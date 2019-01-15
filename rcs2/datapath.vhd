----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Saptarshi Mitra
-- 
-- Create Date:    20:06:42 01/12/2019 
-- Design Name: 
-- Module Name:    datapath - Behavioral 
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

entity datapath is
    Port ( CLK : in  STD_LOGIC;
           EN125 : in  STD_LOGIC;
           EN346 : in  STD_LOGIC;
           EN78 : in  STD_LOGIC;
           S : in  STD_LOGIC_VECTOR (1 downto 0);
			  S_T : in  STD_LOGIC_VECTOR (1 downto 0);
           X1 : in  STD_LOGIC_VECTOR (15 downto 0);
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
           Y4 : out  STD_LOGIC_VECTOR (15 downto 0);
			  Y1_trafo : out  STD_LOGIC_VECTOR (15 downto 0);
           Y2_trafo : out  STD_LOGIC_VECTOR (15 downto 0);
           Y3_trafo : out  STD_LOGIC_VECTOR (15 downto 0);
           Y4_trafo : out  STD_LOGIC_VECTOR (15 downto 0));
end datapath;

architecture Behavioral of datapath is

--adding adop, xorop, mulop, register_16, mux4x1 as componenets

    COMPONENT addop
    PORT(
         I1 : IN  std_logic_vector(15 downto 0);
         I2 : IN  std_logic_vector(15 downto 0);
         O : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
	 
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

    COMPONENT mux4x1
    PORT(
         D0 : IN  std_logic_vector(15 downto 0);
         D1 : IN  std_logic_vector(15 downto 0);
         D2 : IN  std_logic_vector(15 downto 0);
         D3 : IN  std_logic_vector(15 downto 0);
         S : IN  std_logic_vector(1 downto 0);
         O : OUT  std_logic_vector(15 downto 0)
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
	 
	 
--necessary signals to be added to port map between the components properly


Signal mulop_Out : STD_LOGIC_VECTOR (15 downto 0);
Signal addop_Out : STD_LOGIC_VECTOR (15 downto 0);
Signal xor1_Out : STD_LOGIC_VECTOR (15 downto 0);

Signal Mux1_Out : STD_LOGIC_VECTOR (15 downto 0);
Signal Mux2_Out : STD_LOGIC_VECTOR (15 downto 0);
Signal Mux3_Out : STD_LOGIC_VECTOR (15 downto 0);
Signal Mux4_Out : STD_LOGIC_VECTOR (15 downto 0);

Signal Reg1 : STD_LOGIC_VECTOR (15 downto 0);
Signal Reg2 : STD_LOGIC_VECTOR (15 downto 0);
Signal Reg3 : STD_LOGIC_VECTOR (15 downto 0);
Signal Reg4 : STD_LOGIC_VECTOR (15 downto 0);
Signal Reg5 : STD_LOGIC_VECTOR (15 downto 0);
Signal Reg6 : STD_LOGIC_VECTOR (15 downto 0);
Signal Reg7 : STD_LOGIC_VECTOR (15 downto 0);
Signal Reg8 : STD_LOGIC_VECTOR (15 downto 0);


begin

-- I wrote in order of Fig 36, went like this L --> R, T--> B

	mux1: mux4x1 PORT MAP (
          D0 => X1,
          D1 => X4,
          D2 => Z5,
			 D3 => Z6,
			 S => S,
			 O => Mux1_Out
        );
		  
	mux2: mux4x1 PORT MAP (
          D0 => Z1,
          D1 => Z4,
          D2 => Reg5,
			 D3 => Reg8,
			 S => S,
			 O => Mux2_Out
        );
		  
	mux3: mux4x1 PORT MAP (
          D0 => X3,
          D1 => X2,
          D2 => Reg6,
			 D3 => Reg7,
			 S => S,
			 O => Mux3_Out
        );
		  
	mux4: mux4x1 PORT MAP (
          D0 => Z3,
          D1 => Z2,
          D2 => mulop_Out,
			 D3 => mulop_Out,
			 S => S_T,   -- S_T always follows S, but when TRAFO = 1, it's behaviour changes, it is written in control.vhd
			 O => Mux4_Out
        );
		  
	mul: mulop PORT MAP (
          I_1 => Mux1_Out,
          I_2 => Mux2_Out,
          O_1 => mulop_Out
        );
		  
	add: addop PORT MAP (
          I1 => Mux3_Out,
          I2 => Mux4_Out,
          O => addop_Out
        );
		  
	xor_1: xorop PORT MAP (
          I1 => mulop_Out,
          I2 => addop_Out,
          O => xor1_Out
        );
		  
	xor_2: xorop PORT MAP (
          I1 => Reg3,
          I2 => addop_Out,
          O => Y3
        );
		
	xor_3: xorop PORT MAP (
          I1 => Reg2,
          I2 => mulop_out,
          O => Y2
        );
		  
	xor_4: xorop PORT MAP (
          I1 => Reg4,
          I2 => addop_Out,
          O => Y4
        );
		  
	xor_5: xorop PORT MAP (
          I1 => Reg1,
          I2 => mulop_Out,
          O => Y1
        );
	
		
	R1: register_16 PORT MAP (
          CLK => CLK,
          EN => EN125,
          D => mulop_Out,
			 Q => Reg1
        );
		  
		  
	R2: register_16 PORT MAP (
          CLK => CLK,
          EN => EN125,
          D => addop_Out,
			 Q => Reg2
        );
	
	R3: register_16 PORT MAP (
          CLK => CLK,
          EN => EN346,
          D => addop_Out,
			 Q => Reg3
        );
		  
	R4: register_16 PORT MAP (
          CLK => CLK,
          EN => EN346,
          D => mulop_Out,
			 Q => Reg4
        );
		  
	R5: register_16 PORT MAP (
          CLK => CLK,
          EN => EN125,
          D => xor1_Out,
			 Q => Reg5
        );
		  
	R6: register_16 PORT MAP (
          CLK => CLK,
          EN => EN346,
          D => xor1_Out,
			 Q => Reg6
        );
		  
	R7: register_16 PORT MAP (
          CLK => CLK,
          EN => EN78,
          D => mulop_Out,
			 Q => Reg7
        );
		  
	R8: register_16 PORT MAP (
          CLK => CLK,
          EN => EN78,
          D => addop_Out,
			 Q => Reg8
        );
	
		  
	Y1_trafo<=Reg1;
	Y2_trafo<=Reg2;
	Y3_trafo<=Reg3;
	Y4_trafo<=Reg4;
		  
		  
		  
	 
end Behavioral;

