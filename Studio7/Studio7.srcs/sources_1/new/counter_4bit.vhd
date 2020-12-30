----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2020 03:45:24 PM
-- Design Name: 
-- Module Name: counter_4bit - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_4bit is
    PORT (
        ctr_clk : IN STD_LOGIC;
        enable, clear_n, load_n : IN STD_LOGIC;
        initial_value : IN STD_LOGIC_VECTOR(3 downto 0);
        
        counter_output : OUT STD_LOGIC_VECTOR(3 downto 0));
end counter_4bit;

architecture Behavioral of counter_4bit is

    SIGNAL counter_signal : STD_LOGIC_VECTOR(3 downto 0) := "0000";

begin
process (ctr_clk, clear_n)
begin
    if clear_n = '0' then
        counter_signal <= (others => '0');
    elsif (ctr_clk'event and ctr_clk = '1') then
        if load_n = '0' then
        counter_signal <= initial_value;
        else
        if enable = '1' then
        counter_signal <= counter_signal + 1;
        else
        counter_signal <= counter_signal;
        end if;
    end if;
    end if;
end process;
counter_output <= counter_signal;
end Behavioral;
