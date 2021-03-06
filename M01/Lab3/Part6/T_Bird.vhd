Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

Entity T_Bird is
Port(Clk,Reset,LeftT,RightT,Haz:IN std_logic;
	 Light:Out std_logic_vector(5 downto 0));
End Entity;

Architecture behave of T_Bird is
signal clk_slow: std_logic;
signal count: std_logic_vector(25 downto 0);
signal addr: integer range 0 to 9;
Type rom_sequences is ARRAY(0 to 9) of std_logic_vector(5 downto 0);
constant seq: rom_sequences:=("000000","001000","011000","111000",
							  "000000","000100","000110","000111",
							  "000000","111111");
Begin
Slow:Process(Clk)
	Begin
	if(clk'event and clk='1') then count<=count + 1; end if;
	end Process Slow;
clk_slow<=count(23);

Process(clk_slow,Reset)
Begin
	if Reset='0' then light<="000000";
	elsif(clk_slow'event and clk_slow='1') then 
		if (leftT='1' and rightT='1') then 
			light<="111111";
		elsif(LeftT='1') then
			if addr>3 then addr<=0; else addr<=addr+1;end if;
			light<=seq(addr);
		elsif(RightT='1') then
			if (addr>7 or addr<4 )then addr<=4; else addr<=addr+1;end if;
			light<=seq(addr);
		elsif(Haz='0') then
			if (addr>=9 or addr<8 )then addr<=8; else addr<=addr+1;end if;
			light<=seq(addr);
		else light<="000000";
		end if;
	end if;
end Process;
end behave;