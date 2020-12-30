library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity display_driver_2 is
    Port ( inputs : in  STD_LOGIC_VECTOR (3 downto 0);
           seg_out : out  STD_LOGIC_VECTOR (6 downto 0));
end display_driver_2;

architecture Behavioral of display_driver_2 is

begin

with inputs select
seg_out <=
"0001100" when x"1" , -- P
"1000111" when x"2" , -- L
"0000110" when x"3" , -- E
"0001000" when x"4" , -- A
"0010010" when x"5" , -- S
"0000110" when x"6" , -- E
"1111111" when x"7" , -- 
"0001001" when x"8" , -- H
"1111001" when x"9" , -- I
"0101111" when x"A" , -- r
"0000110" when x"B" , -- E
"1111111" when x"C" , -- 
"1000001" when x"D" , -- U
"0010010" when x"E" , -- S
"1111111" when x"F" , -- 
"1111111" when others; --

end Behavioral;
