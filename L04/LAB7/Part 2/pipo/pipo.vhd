library ieee;
use ieee.std_logic_1164.all;

entity pipo is
port( i0,i1,i2,i3, clk, reset : in std_logic ;
		q0,q1,q2,q3 : out std_logic );
end pipo;

architecture behav of pipo is 
signal state : std_logic_vector(3 downto 0);
begin
process(clk,reset)
begin
	if reset='0' then state<="0000";
	elsif (clk'event and clk='1') then state<= i3&i2&i1&i0 ;
	end if;end process;
	
q0<= state(0); q1<= state(1); q2<= state(2); q3<= state(3);

end behav;