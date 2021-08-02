Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
Entity RAM is
Port(Clk,RD,WE: IN std_logic;
	 Addr: IN integer range 0 to 3;
	 Din: IN std_logic_vector(7 downto 0);
	 Dout: OUT std_logic_vector(7 downto 0));
end Entity;

Architecture Behave of RAM is
Type Ram_Array is ARRAY(0 to 3) of std_logic_vector(7 downto 0);
signal ram: Ram_Array;
Begin
Process(Clk)
Begin
	if(clk'event and clk='0') then
		if(RD='1') then dout<=ram(Addr);
		elsif(WE='1') then ram(Addr)<=Din; Dout<="ZZZZZZZZ";
		else Dout<="ZZZZZZZZ";end if;
	end if;
end Process;
End Behave;