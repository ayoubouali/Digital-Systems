Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
Entity Part5 is
Port(clk,RD:IN std_logic;
	Addr:IN integer range 0 to 9;
	Dout:Out std_logic_vector(9 downto 0));
End Entity;

Architecture calc of Part5 is
Type Rom_Array is ARRAY(0 to 9) of integer range 0 to 1023;
constant rom: Rom_Array:=(0,15,36,75,138,231,360,531,750,1023);
Begin
Process(clk)
Begin
	if (clk'event and clk='0') then
		if(RD='0') then Dout<=conv_std_logic_vector(rom(Addr),10);
		else Dout<="ZZZZZZZZZZ";
		end if;
	end if;
end Process;
End calc;