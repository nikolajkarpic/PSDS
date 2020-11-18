----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2020 06:53:37 PM
-- Design Name: 
-- Module Name: brojac - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity brojac is
    Port (
        clk: in std_logic;
        reset: in std_logic;
        
        

        
        
        
        --d: in std_logic_vector(3 downto 0);
        q: out std_logic_vector(3 downto 0);
        en: in std_logic;
        smer: in std_logic
        );
end brojac;

architecture Behavioral of brojac is
signal d_temp, q_reg: std_logic_vector(3 downto 0);

begin
    
    
    process (clk)
    begin
        if (rising_edge(clk)) then 
            if(reset = '1') then  
                q_reg<=(others => '0');
            else
                if(en = '1') then
                    if (smer = '1') then
                        q_reg <= std_logic_vector(unsigned(q_reg) + to_unsigned(1, 4));
                    else
                        q_reg <= std_logic_vector(unsigned(q_reg) - to_unsigned(1, 4));
                    end if;
                end if;
            end if;
        end if;
              
    end process;
    q<= q_reg; 
end Behavioral;
