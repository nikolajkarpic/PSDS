----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/28/2020 07:51:48 PM
-- Design Name: 
-- Module Name: test_proper - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_proper is
    Port ( a_i : in STD_LOGIC_vector(3 downto 1);
           b_i : in STD_LOGIC_vector(3 downto 1);
           c_i : in STD_LOGIC_vector(3 downto 1);
           
           d : in STD_LOGIC_vector(3 downto 1);
           y : out STD_LOGIC);
end test_proper;

architecture Behavioral of test_proper is
constant temp:integer := 4;
signal d_s:std_logic;
signal and1_s:std_logic;
signal and2_s:std_logic;
begin
   
    

end Behavioral;
