Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
Entity part4 is
Port(clk,reset, Dir: IN std_logic;
	 Q: OUT std_logic_vector(3 downto 0));
end part4;

Architecture Behav of part4 is

signal count: std_logic_vector(24 downto 0);
signal count_slow: std_logic_vector(3 downto 0);
signal clk_slow: std_logic;
Begin
Fast:Process(clk)
	Begin
	if (clk'event and clk='1') then count<= count + 1; else count<= count ; end if;
	end Process Fast;
clk_slow<=count(24);
Slow:Process(clk_slow,reset,Dir)
	Begin
	if reset='0' then count_slow<=x"0";
	elsif(clk_slow'event and clk_slow='1') then
		case Dir is
		when '1' => count_slow<=count_slow+1;
		when '0' => count_slow<=count_slow-1;
		end case;
	else count_slow<=count_slow;
	end if;
	End Process Slow;
Q<=count_slow;
End Behav;
	
	