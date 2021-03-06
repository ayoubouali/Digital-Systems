Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
Entity ROM is
Port(Clk,RD: IN std_logic;
	 Addr: IN std_logic_vector(1 downto 0);
	 Dout: OUT std_logic_vector(7 downto 0));
end Entity;

Architecture Behave of ROM is
Type Rom_Array is ARRAY(0 to 3) of std_logic_vector(7 downto 0);
Constant rom: Rom_Array:=("11000000","11010001","11100010","11110011");
Begin
Process(Clk)
Begin
	if(clk'event and clk='0') then
		if(RD='1') then dout<=rom(conv_integer(Addr));
		else Dout<="ZZZZZZZZ";end if;
	end if;
end Process;
End Behave;