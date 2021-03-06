Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

Entity part4 is
	port(	rst,clk: in std_logic;
			NS: out std_logic_vector(2 downto 0);
			EW: out std_logic_vector(2 downto 0));
End Entity;

Architecture behav of part4 is

Type state is (S0,S1,S2,S3);
signal ps: state := S0;
signal counter:std_logic_vector(25 downto 0):=(others=>'0');
signal counter2:std_logic_vector(2 downto 0):=(others=>'0');
signal Timer_Q2,clk_slow:std_logic;

BEGIN

	process(clk,rst)
	begin
		if rst='1' then counter<=(others=>'0');
		elsif counter = 50000000 then counter<=(others=>'0');
		elsif clk'event and clk='1' then counter<= counter + 1;
		end if;
	end process;
	clk_slow<= counter(1);
	
	
	process(clk_slow,rst)
	begin
		if rst='1' then counter2<=(others=>'0');
		elsif counter2 = 5 then counter2<=(others=>'0');
		elsif clk_slow'event and clk_slow='1' then counter2<= counter2 + 1;
		end if;
	end process;
	Timer_Q2<= counter2(2);
	
	
	process(clk_slow,rst)
	begin
		if rst='1' then ps<=S0;
		elsif clk_slow'event and clk_slow='1' then
			case ps is
					when S0 =>	if Timer_Q2='1' then 
										ps<=S1;
										NS<="011";
										EW<="101";
								else
										ps<=S0;
										NS<="011";
										EW<="110";
								end if;
					when S1 =>			
								ps<=S2;
								NS<= "110";
								EW<="011";
								
					when S2 =>	if Timer_Q2='1' then 
										ps<=S3;
										NS<="101";
										EW<="011";
								else
										ps<=S2;
										NS<="110";
										EW<="011";
								end if;
					when S3 =>			
								ps<=S0;
								NS<= "011";
								EW<="110";
					end case;
			
		end if;
	end process;
	
	
		
End;	
		
		
		
		
		
		
		
		
		
		
		