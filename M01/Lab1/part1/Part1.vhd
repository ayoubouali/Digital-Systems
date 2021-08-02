Library ieee;
use ieee.std_logic_1164.all;

Entity Part1 is 
port(clk,rst,w: in std_logic;
			y: out std_logic);
end Part1;

Architecture behavior of Part1 is
 Type state is (s1,s2,s3,s4,s5,s6);
 signal ps: state;
 begin
Process(clk,rst) 
	begin 
		if(rst='1') then ps <= s1;
		elsif(clk'event and clk='1') then
			case ps is
		when s1 => if(w='0')then ps<=s2; else ps<=s1; end if;
		when s2 => if(w='0')then ps<=s3; else ps<=s1; end if;
		when s3 => if(w='0')then ps<=s3; else ps<=s4; end if;
		when s4 => if(w='0')then ps<=s5; else ps<=s1; end if;
		when s5 => if(w='0')then ps<=s3; else ps<=s6; end if;
		when s6 => if(w='0')then ps<=s2; else ps<=s1; end if;
		end case;end if;
	end process;

y<='1' when (ps=s6) else '0';

end behavior;


				
