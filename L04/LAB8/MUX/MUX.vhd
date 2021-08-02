library ieee;
use ieee.std_logic_1164.all;

entity MUX is
port(E,s0,s1,s2: in std_logic;
	X: in std_logic_vector(7 downto 0);
	Y: out std_logic);
end MUX;

architecture behav of MUX is
signal set: std_logic_vector(3 downto 0);
begin
set<= E&s2&s1&s0;

with set select
Y<= X(0) when "0000",
	X(1) when "0001",
	X(2) when "0010",
	X(3) when "0011",
	X(4) when "0100",
	X(5) when "0101",
	X(6) when "0110",
	X(7) when"0111",
	'0'when others;
	

end behav;