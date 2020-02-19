-- Error: Port 'Sig_Name' is assigned to Package_Pin 'XYZ' which can only be used as the N side of a differential clock input.
-- https://www.xilinx.com/support/answers/67599.html

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2018 03:55:57 PM
-- Design Name: 
-- Module Name: SequenceDetector - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SequenceDetector is
    Port ( 
            clk     : in STD_LOGIC;
            Data_In : in STD_LOGIC;              --swt(0) as Data_In
            Clk_Btn : in STD_LOGIC;              --btn(0) used as clock
            --sw      : in STD_LOGIC_VECTOR(2 DOWNTO 0);
            led6_r  : out STD_LOGIC;
            led     : out STD_LOGIC_VECTOR (3 DOWNTO 0)
          );
end SequenceDetector;


architecture Behavioral of SequenceDetector is
component clock_divider is
    Port( clk : in STD_LOGIC;
           clk_out: out STD_LOGIC);
end component;
signal clk_out: std_logic;
TYPE STATES IS (S0,S1,S2,S3,S4,S5,S6,S7,S8);
signal state, next_state: STATES;
--signal next_state: STATES:S0;

begin
    -----Component Instanstation
    divider: clock_divider port map
            (
                clk=>clk,
                clk_out=>clk_out
            );
    SequenceDetector0: -- '01101'
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
        --if clk_out'event and clk_out='1' then
            case state is
                when S0=> 
                          if Data_In='1' then
                             next_state<=S1;
                          else
                             next_state<=S0;
                             
                          end if;
                          led6_r<='0';
                          led<="0001";
                when S1=> 
                          if Data_In='0' then
                               next_state<=S2;
                          else
                               next_state<=S1;
                          end if;
                          led6_r<='0';
                          led<="0010";
                when S2=> 
                          if Data_In='1' then
                             next_state<=S3;
                          else
                             next_state<=S0;
                          end if;
                          led<="0011";
                when S3=> 
                          if Data_In='0' then
                             next_state<=S4;
                          else
                             next_state<=S1;
                          end if;
                          led<="0100";
                 when S4=> 
                          if Data_In='0' then
                             next_state<=S5;
                          else
                             next_state<=S3;
                          end if;
                          led<="0101";
                          
                 when S5=> 
                          if Data_In='1' then
                             next_state<=S6;
                          else
                             next_state<=S0;
                          end if;
                          led<="0110";
                  when S6=> 
                          if Data_In='1' then
                             next_state<=S7;
                          else
                             next_state<=S0;
                          end if;
                          led<="0111";
                          
--                   when S7=> 
--                          if Data_In='1' then
--                             next_state<=S7;
--                          else
--                             next_state<=S0;
--                          end if;
--                          led<="0111";
                  
                when S7=> 
                          led6_r<='1';
                          led<="0001";
                          next_state<=S1;
                when others=>
                          next_state<=S0;
            end case;
        --end if;
   end process;

end Behavioral;
