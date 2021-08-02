library ieee;
use ieee.std_logic_1164.all;

entity sipo is
port( clk, reset,i : in std_logic ;
		q : out std_logic_vector(3 downto 0) );
end sipo;

architecture behav of sipo is 
signal state : std_logic_vector(3 downto 0);
begin
process(clk,reset)
begin
	if reset='0' then state<="0000";
	elsif (clk'event and clk='1') then state<= i&state(3 downto 1) ;
	end if;end process;
	
q<= state;

end behav;