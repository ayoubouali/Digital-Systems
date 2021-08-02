library ieee;
use ieee.std_logic_1164.all;

entity dec is
port(E: in std_logic;
	X: in std_logic_vector(2 downto 0);
	Y: out std_logic_vector(7 downto 0));
end dec;

architecture behav of dec is
signal set: std_logic_vector(3 downto 0);
begin
set<= E&X;

 process(set)
 begin
	case set is 
	when "1000" => Y<="00000001";
	when "1001" => Y<="00000010";
	when "1010" => Y<="00000100";
	when "1011" => Y<="00001000";
	when "1100" => Y<="00010000";
	when "1101" => Y<="00100000";
	when "1110" => Y<="01000000";
	when "1111" => Y<="10000000";
	when others => Y<="00000000";
	end case;
end process;

end behav;