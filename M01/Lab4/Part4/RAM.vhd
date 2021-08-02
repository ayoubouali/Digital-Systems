Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
Entity RAM is
Port(Clk,RD,WE: IN std_logic;
	 Addr: IN std_logic_vector(1 downto 0);
	 Din: IN std_logic_vector(7 downto 0);
	 Dout: OUT std_logic_vector(7 downto 0));
end Entity;

Architecture Behave of RAM is
Type Ram_Array is ARRAY(0 to 3) of std_logic_vector(7 downto 0);
signal ram: Ram_Array;
Begin
Process(Clk)
Begin
	if(clk'event and clk='1') then
		if(RD='1') then Dout<=ram(conv_integer(Addr));
		elsif(WE='1') then ram(conv_integer(Addr))<=Din; Dout<="ZZZZZZZZ";
		else Dout<="ZZZZZZZZ";end if;
	end if;
end Process;
End Behave;