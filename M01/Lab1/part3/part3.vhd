Library ieee;
use ieee.std_logic_1164.all;

Entity Part3 is 
port(clk,rst,w: in std_logic;
			y: out std_logic);
end Part3;

Architecture behavior of Part3 is
 Type state is (s1,s2,s3,s4,s5,s6,s7);
 signal ps: state;
 begin
Process(clk,rst) 
	begin 
		if(rst='1') then ps <= s1;
		elsif(clk'event and clk='1') then
			case ps is
		when s1 => if(w='0')then ps<=s2; else ps<=s5; end if;
		when s2 => if(w='0')then ps<=s2; else ps<=s3; end if;
		when s3 => if(w='0')then ps<=s4; else ps<=s5; end if;
		when s4 => if(w='0')then ps<=s7; else ps<=s3; end if;
		when s5 => if(w='0')then ps<=s6; else ps<=s5; end if;
		when s6 => if(w='0')then ps<=s7; else ps<=s3; end if;
		when s7 => if(w='0')then ps<=s7; else ps<=s7; end if;
		end case;end if;
	end process;
y<='1' when (ps=s4) else '0';
end behavior;

