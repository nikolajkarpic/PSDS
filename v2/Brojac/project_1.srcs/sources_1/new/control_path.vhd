----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/11/2020 12:08:54 PM
-- Design Name: 
-- Module Name: control_path - Behavioral
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

entity control_path is
    Port ( 
        clk: in std_logic;
        reset: in std_logic;

        up_i: in std_logic;
        down_i: in std_logic;
       
        up_down_o: out std_logic;
        en_o: out std_logic
         );
end control_path;

architecture Behavioral of control_path is
    type mc_state_type is (idle, up, down);      
    signal state_reg, state_next: mc_state_type;
    signal up_down_o_s: std_logic;
begin
    process (clk, reset) is
        begin                
            if (reset = '1') then
                state_reg <= idle;                                        
            elsif (rising_edge(clk)) then
                state_reg <= state_next;
            end if;
        end process;        
        
        process(state_reg, up_i, down_i)
        begin
            case state_reg is
                when idle =>
                    en_o <= '0';
                    if (up_i = '1' and down_i = '0') then
                        state_next <= up;
                        up_down_o_s <= '0';
                    elsif (up_i = '0' and down_i = '1') then
                        state_next <= down;
                        up_down_o_s <= '1';
                    else
                        state_next <= idle;
                        up_down_o_s <= '0';
                    end if;
                when up =>
                    en_o <= '1';
                    
                    if(up_i = '0') then
                        state_next <= idle;    
                    else
                        state_next <= up;
                        up_down_o_s <= '0';
                    end if;
                when down =>
                    en_o <= '0';
                    
                    if (down_i = '0') then
                        state_next <= idle;      
                    else 
                        state_next <= down;
                        up_down_o_s <= '1';
                    end if;
            end case;
            
        end process;
        up_down_o <= up_down_o_s;
end Behavioral;
