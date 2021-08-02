library ieee;
use ieee.std_logic_1164.all;

entity johnsons_counter is
port( clk, reset : in std_logic ;
		q : out std_logic_vector(3 downto 0));
end johnsons_counter;

architecture behav of johnsons_counter is 
signal state : std_logic_vector(3 downto 0);
begin
process(clk,reset)
begin
	if reset='0' then state<=(others=>'0');
	elsif (clk'event and clk='1') then state<= not(state(0))&state(3 downto 1) ;
	end if;end process;
	
q<= state;

end behav;