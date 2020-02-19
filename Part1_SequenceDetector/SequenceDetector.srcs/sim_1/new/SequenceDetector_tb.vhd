----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2018 09:40:08 AM
-- Design Name: 
-- Module Name: SequenceDetector_tb - Behavioral
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

entity SequenceDetector_tb is
--  Port ( );
end SequenceDetector_tb;

architecture Behavioral of SequenceDetector_tb is

component SequenceDetector is
    Port
    (
        clk     : in STD_LOGIC;
        Data_In : in STD_LOGIC;              --swt(0) as Data_In
        Clk_Btn : in STD_LOGIC;              --btn(0) used as clock
--        sw      : in STD_LOGIC_VECTOR(2 DOWNTO 0);
        led6_r  : out STD_LOGIC;
        led     : out STD_LOGIC_VECTOR (3 DOWNTO 0)      
    );
end component;

signal clk,Data_In,Clk_Btn: STD_LOGIC;
signal led6_r: STD_LOGIC;
signal led: STD_LOGIC_VECTOR(3 DOWNTO 0);
--signal sw: STD_LOGIC_VECTOR(2 DOWNTO 0);

begin
    sd1: SequenceDetector Port Map
         (
            clk=>clk,
            Data_In=>Data_In,
            Clk_Btn=>Clk_Btn,
--            sw=>sw,
            led6_r=>led6_r,
            led=>led      
         );
    
    simulation: process
    begin

    --Sequence "01101" 
        Clk_Btn<='0';
        Data_In<='0';           --Data bit='0'
        wait for 2 ns;
        Clk_Btn<='1';           --Receive at rising edge
        wait for 2 ns;
        Clk_Btn<='0';

        Data_In<='1';           --Data bit='1'
        wait for 2 ns;
        Clk_Btn<='1';           --Receive at rising edge
        wait for 2 ns;
        Clk_Btn<='0';

        Data_In<='1';           --Data bit='1'
        wait for 2 ns;
        Clk_Btn<='1';           --Receive at rising edge
        wait for 2 ns;
        Clk_Btn<='0';

        Data_In<='0';           --Data bit='0'
        wait for 2 ns;
        Clk_Btn<='1';           --Receive at rising edge
        wait for 2 ns;
        Clk_Btn<='0';

        Data_In<='1';           --Data bit='0'
        wait for 2 ns;
        Clk_Btn<='1';           --Receive at rising edge
        wait for 2 ns;
        Clk_Btn<='0';

    --Sequence "0101101"    
        Clk_btn<='0';
        Data_In<='0';           --Data bit='0'
        wait for 2 ns;
        Clk_Btn<='1';           --Receive at rising edge
        wait for 2 ns;
        Clk_Btn<='0';

        Data_In<='1';           --Data bit='1'
        wait for 2 ns;
        Clk_Btn<='1';           --Receive at rising edge
        wait for 2 ns;
        Clk_Btn<='0';

        Data_In<='0';           --Data bit='0'
        wait for 2 ns;
        Clk_Btn<='1';           --Receive at rising edge
        wait for 2 ns;
        Clk_Btn<='0';

        Data_In<='1';           --Data bit='1'
        wait for 2 ns;
        Clk_Btn<='1';           --Receive at rising edge
        wait for 2 ns;
        Clk_Btn<='0';

        Data_In<='1';           --Data bit='1'
        wait for 2 ns;
        Clk_Btn<='1';           --Receive at rising edge
        wait for 2 ns;
        Clk_Btn<='0';

        Data_In<='0';           --Data bit='0'
        wait for 2 ns;
        Clk_Btn<='1';           --Receive at rising edge
        wait for 2 ns;
        Clk_Btn<='0';

        Data_In<='1';           --Data bit='1'
        wait for 2 ns;
        Clk_Btn<='1';           --Receive at rising edge
        wait for 2 ns;
        Clk_Btn<='0';


        
    end process;
    
end Behavioral;
