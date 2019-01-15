----------------------------------------------------------------------------------
-- TUM
-- Engineer: Martin Strasser, Ning Chen
-- 
-- Create Date:    16:34:40 06/16/2008 
-- Design Name: 
-- Module Name:    idea_com - Behavioral 
-- Project Name:   idea lab
-- Target Devices: Spartan 3E
-- Tool versions:  > 9.2
-- Description:    This file is intended to be the top
--                 level module. It brings the clock generator
--                 and the clocked idea module together. 
--
-- Revision 1.00 - File created and tested
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Make this the top module:

entity idea_com is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           RxD : in  STD_LOGIC;
           TxD : out  STD_LOGIC;
           LEDs : out  STD_LOGIC_VECTOR (7 downto 0));
end idea_com;

architecture Behavioral of idea_com is

-- Mapping the inner idea part.
-- The outer part is only to syntesize
-- the clock generator properly.
component idea_com_inner
	port ( Clk : in  STD_LOGIC;
          Reset : in  STD_LOGIC;
          RxD : in  STD_LOGIC;
          TxD : out  STD_LOGIC;
          LEDs : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

-- The clock generator for the UART.
-- This block generates a clock of approx. 16*9600 Hz
-- from the 50 MHz system clock.
component clk_div
   port ( CLK : in  STD_LOGIC;
          CLK_OUT : out  STD_LOGIC );
end component;

signal clk_out : STD_LOGIC;
begin	
	clk_div_1 : clk_div port map( clk, clk_out );
	idea_1 : idea_com_inner port map( clk_out, Reset, RxD, TxD, LEDs );
end Behavioral;


