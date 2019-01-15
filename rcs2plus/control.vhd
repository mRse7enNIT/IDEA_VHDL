----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Saptarshi Mitra
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    control - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control is
    Port ( CLK : in  STD_LOGIC;
           INIT : in  STD_LOGIC;
           TRAFO : in STD_LOGIC;
           EN125 : out  STD_LOGIC;
           EN346 : out  STD_LOGIC;
           EN78 : out  STD_LOGIC;
           RESULT : out  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR(1 downto 0);
           S_T: out STD_LOGIC_VECTOR(1 downto 0));	
end control;

architecture Behavioral of control is

signal cin : std_logic_vector(2 downto 0) :="111";

--signal initialized: integer := 0;

begin


-- This is without implementing TRAFO, work by Sreetama, this is smartest implementation
--counter: process(CLK)
--	begin
--		--if(rising_edge(INIT)) then
--			if(rising_edge(CLK)) then
--				cin <= cin + 1;
--				if(cin = "111") then
--					if(INIT = '1') then
--						cin <= "000";
--					else
--						cin <= "111";
--					end if;
--				end if;
--			
--			end if;
--		--end if;
--        
--        --Count <= cin;
--	end process;


-- This is without implementing TRAFO, work by me
--counter: process(CLK)
--	begin
--		--if(rising_edge(INIT)) then
--			if(rising_edge(CLK)) then
--				if(cin/="111") then
--					cin <= cin + 1;
--				elsif(cin = "111") then
--					if(INIT = '1') then
--						cin <= "000";
--					else
--						cin <= "111";
--					end if;
--				end if;
--			
--			end if;
--		--end if;
--        
--        --Count <= cin;
--	end process;
	

counter: process(CLK,TRAFO)
	begin
		if TRAFO = '0' then
			if(rising_edge(CLK)) then
				if(cin/="111" and cin/="110") then
					cin <= cin + 2;
				elsif(cin = "110") then
					cin <= cin + 1;
				elsif(cin = "111") then
					if(INIT = '1') then
						cin <= "000";
					else
						cin <= "111";
					end if;
				end if;
			
			end if;
		
		else
			if(rising_edge(CLK)) then
				if(cin/="111" and cin/="011" and cin/="110") then
					cin <= cin + 2;
				elsif(cin = "110") then
					cin <= cin + 1;
				elsif(cin = "011") then
					cin <= "110";
				elsif(cin = "111") then
					if(INIT = '1') then
						cin <= "000";
					else
						cin <= "111";
					end if;
				end if;
			
			end if;
		end if;
        
        --Count <= cin;
	end process;
	
	

--counter: process(CLK)
--	begin
--		--if(rising_edge(INIT)) then
--		if(rising_edge(CLK)) then
--			if(INIT = '1') then								
--				if(cin = "111") then
--					cin <= "000";
--					initialized <= 1;
--				elsif(initialized = 1) then
--					cin <= cin + 1;
--				end if;
--			elsif(initialized = 1 and cin/= "111") then
--				cin <= cin + 1;
--			elsif(cin = "111" and INIT = '0') then
--				cin <= cin;
--				initialized <= 0;
--			end if;
--			
--			
--		end if;
--		--end if;
--        
--        --Count <= cin;
--	end process;
	
comb_logic: process(cin,TRAFO)
	begin
		case cin is
			when "000" =>
				EN125 <= '1';
				EN346 <= '0';
				EN78 <= '0';
				RESULT <= '0';
				S <= "00";
				if TRAFO ='0' then
					S_T <= "00";
				else
					S_T <= "01";
				end if;
			
			when "001" =>
				EN125 <= '0';
				EN346 <= '0';
				EN78 <= '0';
				RESULT <= '0';
				S <= "00";
				if TRAFO ='0' then
					S_T <= "00";
				else
					S_T <= "01";
				end if;
				
			when "010" =>
				EN125 <= '0';
				EN346 <= '1';
				EN78 <= '0';
				RESULT <= '0';
				S <= "01";
				if TRAFO ='0' then
					S_T <= "01";
				else
					S_T <= "00";
				end if;
				
			when "011" =>
				EN125 <= '0';
				EN346 <= '0';
				EN78 <= '0';
				RESULT <= '0';
				S <= "01";
				if TRAFO ='0' then
					S_T <= "01";
				else
					S_T <= "00";
				end if;
				
			when "100" =>
				EN125 <= '0';
				EN346 <= '0';
				EN78 <= '1';
				RESULT <= '0';
				S <= "10";
				S_T <= "10";
				
			when "101" =>
				EN125 <= '0';
				EN346 <= '0';
				EN78 <= '0';
				RESULT <= '0';
				S <= "10";
				S_T <= "10";
				
			when "110" =>
				EN125 <= '0';
				EN346 <= '0';
				EN78 <= '0';
				RESULT <= '1';
				S <= "11";
				if TRAFO ='0' then
					S_T <= "11";
				else
					S_T <= "10";
				end if;
				
			when "111" =>
				EN125 <= '0';
				EN346 <= '0';
				EN78 <= '0';
				RESULT <= '0';
				S <= "11";
				if TRAFO ='0' then
					S_T <= "11";
				else
					S_T <= "10";
				end if;
				
			when others =>
		end case;

	end process;

end Behavioral;

