library ieee;
use ieee.std_logic_1164.all;

entity ring_counter is
port( clk, reset : in std_logic ;
		q : out std_logic_vector(3 downto 0));
end ring_counter;

architecture behav of ring_counter is 
signal state : std_logic_vector(3 downto 0);
begin
process(clk,reset)
begin
	if reset='0' then state<="1000";
	elsif (clk'event and clk='1') then state<= state(0)&state(3 downto 1) ;
	end if;end process;
	
q<= state;

end behav;