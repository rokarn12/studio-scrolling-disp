library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity display_driver_4 is
    Port ( inputs : in  STD_LOGIC_VECTOR (3 downto 0);
           seg_out : out  STD_LOGIC_VECTOR (6 downto 0));
end display_driver_4;

architecture Behavioral of display_driver_4 is

begin

with inputs select
seg_out <=
"0001100" when x"3" , -- P
"1000111" when x"4" , -- L
"0000110" when x"5" , -- E
"0001000" when x"6" , -- A
"0010010" when x"7" , -- S
"0000110" when x"8" , -- E
"1111111" when x"9" , -- 
"0001001" when x"A" , -- H
"1111001" when x"B" , -- I
"0101111" when x"C" , -- r
"0000110" when x"D" , -- E
"1111111" when x"E" , -- 
"1000001" when x"F" , -- U
"0010010" when x"0" , -- S
"1111111" when x"1" , -- 
"1111111" when others; --

end Behavioral;
