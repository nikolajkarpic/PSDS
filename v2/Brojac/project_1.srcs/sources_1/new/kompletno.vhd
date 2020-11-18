----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/11/2020 01:21:39 PM
-- Design Name: 
-- Module Name: kompletno - struct
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

entity kompletno is
    Port ( 
        clk: in std_logic;
        reset: in std_logic;

        up_i: in std_logic;
        down_i: in std_logic;

        q: out std_logic_vector(3 downto 0)
    );
end kompletno;

architecture struct of kompletno is
signal up_down_o_s, up_i_s, down_i_s, en_i_s, en_o_s: std_logic;
begin
    control_path: entity work.control_path(Behavioral)
        port map(
            clk => clk,
            reset => reset,
            up_i => up_i,
            down_i => down_i,
            en_o => en_o_s,
            up_down_o => up_down_o_s
        );

    data_path: entity work.data_path(struct)
        port map(
            clk => clk,
            reset => reset,
            en_i => en_o_s,
            up_down_i => up_down_o_s,
            q => q

        );
end struct;
