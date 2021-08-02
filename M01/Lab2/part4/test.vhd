Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

Entity test is
port(
		clk,rst: in std_logic;
		NS,EW: out std_logic_vector(2 downto 0));
end entity;

architecture behav of test is

type state is (s0,s1,s2,s3);
signal ps:state :=s0;
signal counter1:std_logic_vector(25 downto 0):=(others=>'0');
signal counter2:std_logic_vector(2 downto 0):=(others=>'0');
signal Timer,clk_slow: std_logic;

BEGIN

	process(clk,rst)
	begin
		if rst='1' then counter1<=(others=>'0');
		elsif counter1 = 50000000 then counter1<=(others=>'0');
		elsif clk'event and clk='1' then counter1<= counter1 + 1;
		end if;
	end process;
	clk_slow<=counter1(1);
	
	
	process(clk_slow,rst)
	begin
		if rst='1' then counter2<=(others=>'0');
		elsif counter2 = 5 then counter2<=(others=>'0');
		elsif clk_slow'event and clk_slow='1' then counter2<= counter2 + 1;
		end if;
	end process;
	Timer<=counter2(2);
	
	
	process(clk_slow,rst)
	begin
		if rst='1' then ps<=s0;
		elsif clk_slow'event and clk_slow='1' then 
			case ps is
		when s0=> 	if timer='1' then 
							ps<=s1;
							NS<="011";
							EW<="101";
					else
							ps<=s0;
							NS<="011";
							EW<="110";
					end if;
		when s1=>	
					ps<=s2;
					NS<="110";
					EW<="011";
		
		when s2=> 	if timer='1' then 
							ps<=s3;
							NS<="101";
							EW<="011";
					else
							ps<=s2;
							NS<="110";
							EW<="011";
					end if;
		when s3=>	
					ps<=s0;
					NS<="011";
					EW<="110";
		
		end case;
		
		end if;
	end process;
	
	
	
end ;	
	