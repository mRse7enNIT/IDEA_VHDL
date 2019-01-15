----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    idea_rcs2 - Structural 
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

entity idea_rcs2plus is
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
end idea_rcs2plus;

architecture Structural of idea_rcs2plus is


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
	 
	 COMPONENT clockedround
    PORT(
         CLK : IN  std_logic;
         INIT : IN  std_logic;
         TRAFO : IN  std_logic;
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
         Y4 : OUT  std_logic_vector(15 downto 0);
         RESULT : OUT  std_logic;
         Y1_TRAFO : OUT  std_logic_vector(15 downto 0);
         Y2_TRAFO : OUT  std_logic_vector(15 downto 0);
         Y3_TRAFO : OUT  std_logic_vector(15 downto 0);
         Y4_TRAFO : OUT  std_logic_vector(15 downto 0)
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
	 
	 COMPONENT roundcounter
    PORT(
         CLK : IN  std_logic;
         START : IN  std_logic;
         RESULT : IN  std_logic;
         READY : OUT  std_logic;
         S_i : OUT  std_logic;
         INIT : OUT  std_logic;
         TRAFO : OUT  std_logic;
         ROUND : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
	 
	 

Signal mux_1_out : STD_LOGIC_VECTOR (15 downto 0);
Signal mux_2_out : STD_LOGIC_VECTOR (15 downto 0);
Signal mux_3_out : STD_LOGIC_VECTOR (15 downto 0);
Signal mux_4_out : STD_LOGIC_VECTOR (15 downto 0);

Signal sig_Round : STD_LOGIC_VECTOR (3 downto 0);
Signal sig_Si : STD_LOGIC;
Signal sig_Trafo : STD_LOGIC;
Signal sig_Init : STD_LOGIC;
Signal sig_Result : STD_LOGIC;

Signal sig_Z1 : STD_LOGIC_VECTOR (15 downto 0);
Signal sig_Z2 : STD_LOGIC_VECTOR (15 downto 0);
Signal sig_Z3 : STD_LOGIC_VECTOR (15 downto 0);
Signal sig_Z4 : STD_LOGIC_VECTOR (15 downto 0);
Signal sig_Z5 : STD_LOGIC_VECTOR (15 downto 0);
Signal sig_Z6 : STD_LOGIC_VECTOR (15 downto 0);

Signal sig_RY1 : STD_LOGIC_VECTOR (15 downto 0);
Signal sig_RY2 : STD_LOGIC_VECTOR (15 downto 0);
Signal sig_RY3 : STD_LOGIC_VECTOR (15 downto 0);
Signal sig_RY4 : STD_LOGIC_VECTOR (15 downto 0);

Signal sig_RO1 : STD_LOGIC_VECTOR (15 downto 0);
Signal sig_RO2 : STD_LOGIC_VECTOR (15 downto 0);
Signal sig_RO3 : STD_LOGIC_VECTOR (15 downto 0);
Signal sig_RO4 : STD_LOGIC_VECTOR (15 downto 0);




begin


m1: mux2x1 PORT MAP (D0=>sig_RO1,D1=>X_1,S=>sig_Si,O=>mux_1_out);
m2: mux2x1 PORT MAP (D0=>sig_RO2,D1=>X_2,S=>sig_Si,O=>mux_2_out);
m3: mux2x1 PORT MAP (D0=>sig_RO3,D1=>X_3,S=>sig_Si,O=>mux_3_out);
m4: mux2x1 PORT MAP (D0=>sig_RO4,D1=>X_4,S=>sig_Si,O=>mux_4_out);


Reg1: register_16 PORT MAP (CLK=>CLOCK,EN=>sig_Result,D=>sig_RY1,Q=>sig_RO1);
Reg2: register_16 PORT MAP (CLK=>CLOCK,EN=>sig_Result,D=>sig_RY2,Q=>sig_RO2);
Reg3: register_16 PORT MAP (CLK=>CLOCK,EN=>sig_Result,D=>sig_RY3,Q=>sig_RO3);
Reg4: register_16 PORT MAP (CLK=>CLOCK,EN=>sig_Result,D=>sig_RY4,Q=>sig_RO4);

K1: keygen PORT MAP (ROUND=>sig_Round,KEY=>KEY,KEY1=>sig_Z1,KEY2=>sig_Z2,KEY3=>sig_Z3,KEY4=>sig_Z4,KEY5=>sig_Z5,KEY6=>sig_Z6);

CR: clockedround PORT MAP (CLK=>CLOCK,TRAFO => sig_Trafo, INIT => sig_Init, X1=>mux_1_out, X2=>mux_2_out, X3=>mux_3_out,X4=>mux_4_out,
									Z1=>sig_Z1, Z2=>sig_Z2, Z3=>sig_Z3, Z4=>sig_Z4, Z5=>sig_Z5, Z6=>sig_Z6,
									Y1=>sig_RY1, Y2=>sig_RY2, Y3=>sig_RY3, Y4=>sig_RY4,RESULT=>sig_Result,
									Y1_TRAFO=>Y_1,Y2_TRAFO=>Y_2,Y3_TRAFO=>Y_3,Y4_TRAFO=>Y_4);

RC: roundcounter PORT MAP (CLK =>CLOCK, START=> START, RESULT=>sig_Result,READY=>READY,
									S_i=>sig_Si, INIT => sig_Init, TRAFO=>sig_Trafo, ROUND=>sig_Round);
end Structural;

