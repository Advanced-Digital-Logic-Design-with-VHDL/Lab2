----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/01/2019 02:21:03 PM
-- Design Name: 
-- Module Name: dna_tb - Behavioral
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

entity dna_tb is
   
end dna_tb;

architecture Behavioral of dna_tb is
component SequenceDetector is
    Port
    (
        clk     : in STD_LOGIC;
        Data_In : in STD_LOGIC_Vector(1 DOWNTO 0);              --swt(0) as Data_In
        Clk_Btn : in STD_LOGIC;              --btn(0) used as clock
        sw      : in STD_LOGIC_VECTOR(3 DOWNTO 0);
        led6_r  : out STD_LOGIC;
        led     : out STD_LOGIC_VECTOR (3 DOWNTO 0)      
    );
end component;

component clock_divider is
    Port ( clk : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end component;

signal clk,Clk_Btn, clk_out: STD_LOGIC;
signal led6_r: STD_LOGIC;
signal Data_In: STD_LOGIC_VECTOR(1 DOWNTO 0);
signal led: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal sw: STD_LOGIC_VECTOR(3 DOWNTO 0);



begin

divider: clock_divider port map(   
            clk=>clk,
            clk_out=>clk_out
        );
        
        
 sd1: SequenceDetector Port Map
         (
            clk=>clk,
            Data_In=>Data_In,
            Clk_Btn=>Clk_Btn,
            sw=>sw,
            led6_r=>led6_r,
            led=>led      
         );

    simulation: process
    begin
--Sequence "ATTCGC"    
        Data_In<="00";           -- A
        wait for 3 ns;

        Data_In<="01";           -- T
        wait for 3 ns;

        Data_In<="01";           -- T
        wait for 3 ns;
        
        Data_In<="10";           -- C
        wait for 3 ns;
        
        Data_In<="11";           -- G
        wait for 3 ns;
        
        Data_In<="10";           -- C
        wait for 3 ns;
        
        Data_In<="00";           -- A (Go to S1)
        wait for 3 ns;
        
    end process;

end Behavioral;
