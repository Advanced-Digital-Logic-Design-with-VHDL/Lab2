----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2019 04:23:46 PM
-- Design Name: 
-- Module Name: dna - Behavioral
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

entity dna is
    Port ( clk : in STD_LOGIC;
           Data_LSB: in STD_LOGIC;
           Data_MSB: in STD_LOGIC;
           Data_In: in STD_LOGIC_VECTOR( 1 downto 0);
           led6_r : out STD_LOGIC;
           led : out STD_LOGIC_VECTOR (3 downto 0));
end dna;

architecture Behavioral of dna is

component clock_divider is
    Port( clk : in STD_LOGIC;
           clk_out: out STD_LOGIC);
end component;

signal clk_out: std_logic;
TYPE STATES IS (S0,S1,S2,S3,S4,S5,S6);
signal state, next_state: STATES;
--signal next_state: STATES:S0;


begin
    -----Component Instanstation
    divider: clock_divider port map
            (
                clk=>clk,
                clk_out=>clk_out
            );
    DNAdetector: -- 'ATTCGC --> '
    process (clk_out)
    begin
        if clk_out'event and clk_out='1' then
            state<=next_state;
            else 
            state <= state;
        end if;    
    
    end process;
    
    NS: process (Data_In, state) 
    begin
            case state is
                when S0=> 
                          if Data_In= "00"  then
                             next_state <= S1;
                          else 
                             next_state<=S0;      
                          end if;
                          led6_r<='0';
                          led<="0000";
                when S1=> 
                          if Data_In= "00" then
                               next_state<=S1;
                          elsif Data_In = "01" then
                               next_state<=S2;
                          else
                               next_state<=S0;
                          end if;
                          led6_r<='0';
                          led<="0001";
                when S2=> 
                          if Data_In= "00" then
                             next_state<=S1;
                          elsif Data_In= "01" then
                               next_state<=S3;
                          else
                             next_state<=S0;
                          end if;
                          led<="0010";
                when S3=> 
                          if Data_In = "00" then
                             next_state<=S1;
                          elsif Data_In ="10" then
                               next_state<=S4;
                          else
                             next_state<=S0;
                          end if;
                          led<="0011";
                 when S4=> 
                          if Data_In = "00" then
                             next_state<=S1;
                          elsif Data_In = "11" then
                               next_state<=S5;
                          else
                             next_state<=S0;
                          end if;
                          led<="0100";
                          
                 when S5=> 
                          if Data_In= "00" then
                             next_state<=S1;
                          elsif Data_In= "10" then
                               next_state<=S6;
                          else
                             next_state<=S0;
                          end if;
                          led<="0101";
                  
                when S6=> 
                          led6_r<='1';
                          led<="0110";
                          next_state<=S1;
                when others=>
                          next_state<=S0;
            end case;
   end process;

end Behavioral;
