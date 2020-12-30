library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity display_driver is
    Port ( inputs : in  STD_LOGIC_VECTOR (3 downto 0);
           seg_out : out  STD_LOGIC_VECTOR (6 downto 0));
end display_driver;

architecture Behavioral of display_driver is

begin

with inputs select
seg_out <=
"0001100" when x"0" , -- P
"1000111" when x"1" , -- L
"0000110" when x"2" , -- E
"0001000" when x"3" , -- A
"0010010" when x"4" , -- S
"0000110" when x"5" , -- E
"1110111" when x"6" , -- _
"0001001" when x"7" , -- H
"1111001" when x"8" , -- I
"0101111" when x"9" , -- r
"0000110" when x"A" , -- E
"1110111" when x"B" , -- _
"1000001" when x"C" , -- U
"0010010" when x"D" , -- S
"1111111" when x"E" , -- 
"1111111" when others;

end Behavioral;

