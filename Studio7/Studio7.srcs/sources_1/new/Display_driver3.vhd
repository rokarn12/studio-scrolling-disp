library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity display_driver3 is
    Port ( inputs : in  STD_LOGIC_VECTOR (3 downto 0);
           seg_out : out  STD_LOGIC_VECTOR (6 downto 0));
end display_driver3;

architecture Behavioral of display_driver3 is

begin

with inputs select
seg_out <=
"0001100" when x"2" , -- P
"1000111" when x"3" , -- L
"0000110" when x"4" , -- E
"0001000" when x"5" , -- A
"0010010" when x"6" , -- S
"0000110" when x"7" , -- E
"1111111" when x"8" , -- 
"0001001" when x"9" , -- H
"1111001" when x"A" , -- I
"0101111" when x"B" , -- r
"0000110" when x"C" , -- E
"1111111" when x"D" , -- 
"1000001" when x"E" , -- U
"0010010" when x"F" , -- S
"1111111" when x"0" , -- 
"1111111" when others; --

end Behavioral;
