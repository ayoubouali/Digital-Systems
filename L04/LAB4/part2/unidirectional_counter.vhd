library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned;

entity unidirectional_counter is
port(clk,clr : in std_logic;
		q : out std_logic_vector(3 downto 0));
end unidirectional_counter;

architecture arch of unidirectional_counter is 
signal state : std_logic_vector(3 downto 0);

begin 
process(clk,clr)
begin
if clr<='0' then state<="0000";
elsif (clk' event and clk='0') then 
	if state<="1111" then state<="0000";
	else state<= state+1;
	end if;
end if;
end process;
q<= state;
end arch;