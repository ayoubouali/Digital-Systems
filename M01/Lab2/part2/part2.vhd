library ieee;
use ieee.std_logic_1164.all;

entity part2 is
port(clk,rst,nickel_in,dime_in,quarter_in:in std_logic;
		candy_out,nickel_out,dime_out: out std_logic);
end entity;

architecture behavior of part2 is
type state is (s0,s5,s10,s15,s20,s25,s30,s35,s40,s45);
signal ps:state;
begin
transition: process(clk,rst) is
	begin
	if(rst='1') then ps<=s0;
	elsif(clk'event and clk='1')then 
		case ps is 
when s0=> if(nickel_in='1') then ps<=s5; elsif(dime_in='1') then ps<=s10;
			elsif(quarter_in='1') then ps<=s25; else ps<=s0; end if;
when s5=> if(nickel_in='1') then ps<=s10; elsif(dime_in='1') then ps<=s15;
			elsif(quarter_in='1') then ps<=s30; else ps<=s5; end if;
when s10=> if(nickel_in='1') then ps<=s15; elsif(dime_in='1') then ps<=s20;
			elsif(quarter_in='1') then ps<=s35; else ps<=s10; end if;
when s15=> if(nickel_in='1') then ps<=s20; elsif(dime_in='1') then ps<=s25;
			elsif(quarter_in='1') then ps<=s40; else ps<=s15; end if;
when s20=> if(nickel_in='1') then ps<=s25; elsif(dime_in='1') then ps<=s30;
			elsif(quarter_in='1') then ps<=s45; else ps<=s20; end if;
when s25=> ps<=s0;
when s30=> ps<=s25;
when s35=> ps<=s25;
when s40=> ps<=s30;
when s45=> ps<=s35;
end case;
end if;
end process transition;

output:process(ps) is
	begin
	case ps is
when s0=> candy_out<='0';nickel_out<='0';dime_out<='0';
when s5=> candy_out<='0';nickel_out<='0';dime_out<='0';
when s10=> candy_out<='0';nickel_out<='0';dime_out<='0';
when s15=> candy_out<='0';nickel_out<='0';dime_out<='0';
when s20=> candy_out<='0';nickel_out<='0';dime_out<='0';
when s25=> candy_out<='1';nickel_out<='0';dime_out<='0';
when s30=> candy_out<='0';nickel_out<='1';dime_out<='0';
when s35=> candy_out<='0';nickel_out<='0';dime_out<='1';
when s40=> candy_out<='0';nickel_out<='0';dime_out<='1';
when s45=> candy_out<='0';nickel_out<='0';dime_out<='1';
end case; end process output;

end behavior;