library ieee;
use ieee.std_logic_1164.all;

entity part1b is
port(clk,rst:in std_logic;
		w: in integer;
		y: out std_logic);
end entity;

architecture behavior of part1b is
type state is (s1,s2,s3,s4,s5,s6);
signal ps:state;
begin
process(clk,rst) 
	begin
	if(rst='1') then ps<=s1;
	elsif(clk'event and clk='1')then 
		case ps is 
when s1=> if(w=1) then ps<=s2; else ps<=s1; end if;
when s2=> if(w=2) then ps<=s3; else ps<=s1; end if;
when s3=> if(w=3) then ps<=s4; else ps<=s1; end if;
when s4=> if(w=4) then ps<=s5; else ps<=s1; end if;
when s5=> if(w=5) then ps<=s6; else ps<=s1; end if;
when s6=> if(w=1) then ps<=s2; else ps<=s1; end if;
end case;
end if;
end process;

y<='1' when(ps=s6) else '0';

end;