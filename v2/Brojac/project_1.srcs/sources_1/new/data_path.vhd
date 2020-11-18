----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/11/2020 12:20:20 PM
-- Design Name: 
-- Module Name: data_path - struct
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

entity data_path is
    Port ( 
        clk: in std_logic;
        reset: in std_logic;

        en_i: in std_logic;
        up_down_i: in std_logic;

        q: out std_logic_vector(3 downto 0)
        );
end data_path;

architecture struct of data_path is
signal up_down_o_s: std_logic;
begin
    brojac: entity work.brojac(Behavioral)
        port map(
                clk => clk,
                reset => reset,
                en => en_i,
                smer => up_down_i,
                q => q
                );

    
end struct;
