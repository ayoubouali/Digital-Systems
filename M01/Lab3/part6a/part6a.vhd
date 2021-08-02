library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity part6a is
	port(	LT,RT,Haz,rst,clk: in std_logic;
			lights: out std_logic_vector(5 downto 0));
end entity;

architecture behav of part6a is
type rom is array (0 to 9) of std_logic_vector(5 downto 0);
signal my_rom:rom :=	("000000","001000","011000","111000",
						"000000","000100","000110","000111",
						"000000","111111");
						
signal counter: std_logic_vector(25 downto 0):=(others=>'0');
signal clk_slow: std_logic;
signal addr: integer range 0 to 9;

begin
clk_divider: process(clk,rst) is
	begin
	if (rst='1') then counter<=(others=>'0');
	elsif(clk'event and clk='1') then 
		if (counter=50000000) then counter<=(others=>'0');
		else counter<=counter+1;
		end if;
	end if; end process clk_divider;
clk_slow<= counter(1);


process(rst,clk_slow) is
	begin
	if(rst='1') then lights<="000000";
	elsif(clk_slow'event and clk_slow='1') then
		if(Haz='1') then
			if(addr<8 or addr>9) then addr<=8; else addr<=addr+1; end if;
			lights<= my_rom(addr);
		elsif(LT='1' and RT='1') then lights<="111111";
		elsif(LT='1') then
			if(addr>3) then addr<=0; else addr<=addr+1; end if;
			lights<= my_rom(addr);
		elsif(RT='1') then
			if(addr<4 or addr>7) then addr<=4; else addr<=addr+1; end if;
			lights<= my_rom(addr);
		
		else lights<="000000"; end if;
	end if; end process;
	
end behav;
	
	
	
	
	
	

