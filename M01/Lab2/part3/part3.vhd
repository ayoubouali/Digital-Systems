library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity part3 is 
port(clk,rst,ENA: in std_logic;	
		light: out std_logic);
end entity;

architecture behavior of part3 is

signal counter:std_logic_vector(25 downto 0):=(others=>'0');
signal clk_slow:std_logic;

type state is (stop,onn,off);
signal ps:state;
signal count:std_logic_vector(2 downto 0):="000";

begin

clk_divider: process(clk,rst) is 
	begin
	if(rst='1') then clk_slow<='0';counter<=(others=>'0');
	elsif (clk'event and clk='1') then 
		if(counter=25000000) then clk_slow<= not clk_slow; counter<=(others=>'0');
		else counter<=counter + 1; end if;
	end if;
	end process clk_divider;

transition: process(clk_slow,rst) is
	begin
	if(rst='1')then ps<=stop;
	elsif(clk_slow'event and clk_slow='1') then
		case ps is
when stop=> if(ENA='1') then ps<=onn; end if;
when onn=> if(ENA='0') then ps<=stop; 
			elsif (count=6) then ps<=off; count<=(others=>'0');
			else count<=count+1;end if;
when off=> if(ENA='0') then ps<=stop; 
			elsif (count=2) then ps<=onn; count<=(others=>'0'); 
			else count<=count+1;end if;
		end case;
		end if;
	end process transition;

light<='1' when(ps<=onn) else '0';

end behavior;
	
	
	
	