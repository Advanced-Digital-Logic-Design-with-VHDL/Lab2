----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2019 01:58:13 PM
-- Design Name: 
-- Module Name: clock_divider - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_divider is
    Port ( clk : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end clock_divider;

architecture Behavioral of clock_divider is
signal clock_out : std_logic;
signal count : integer;

begin
     process(clk) 
        begin 
        if clk = '1' and clk'event then 
            if (count < 250000000) then --2secs 250000000
                count <= count + 1;
                clock_out <= '0';
            else 
                count <= 0;
                clock_out<= '1';
            end if;
            clk_out<=clock_out;
         end if;
       end process ;

end Behavioral;
