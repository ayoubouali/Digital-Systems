library ieee;
use ieee.std_logic_1164.all;

entity usr is
port( clk, reset,s1,s0,Isr,Isl : in std_logic ;
		I : in std_logic_vector(3 downto 0);
		Q : out std_logic_vector(3 downto 0);
		Qr, Ql : out std_logic);
end usr;

architecture behav of usr is 
signal state : std_logic_vector(3 downto 0);
signal func : std_logic_vector(1 downto 0); 
begin  func<= s1&s0;
process(clk,reset)
begin
	if reset='0' then state<="0000";
	elsif (clk'event and clk='1') then 
	case func is
		when"00" => state<=state;
		when"01" => state<=Isr&state(3 downto 1);
		when"10" => state<= state(2 downto 0)&Isl;
		when"11" => state<=I;
		end case;
	end if;end process;
Q<=state; Qr<=state(0); Ql<=state(3);

end behav;