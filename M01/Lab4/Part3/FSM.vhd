Library ieee;
use ieee.std_logic_1164.all;

Entity FSM is
Port(Clk,Reset: IN std_logic;
	Addr:Out std_logic_vector(1 downto 0);
	c_Rom,c_Ram,c_Read: OUT std_logic);
End Entity;

Architecture Behave of FSM is
TYPE state is (S1,S2,S3,S4,S5,S6,S7,S8);
signal PS: state;

Begin
States:Process(Clk,Reset)
	Begin
	if(Reset='1') then PS<=S1;
	elsif(clk'event and clk='1') then
		case PS is
		when S1 => PS<=S2;
		when S2 => PS<=S3;
		when S3 => PS<=S4;
		when S4 => PS<=S5;
		when S5 => PS<=S6;
		when S6 => PS<=S7;
		when S7 => PS<=S8;
		when S8 => PS<=S1;
		end case;
	end if;
	end Process States;
Output:Process(PS)
	Begin
	case PS is
	when S1 => Addr<="00";c_Rom<='1';c_Ram<='1';c_Read<='0';
	when S2 => Addr<="01";c_Rom<='1';c_Ram<='1';c_Read<='0';
	when S3 => Addr<="10";c_Rom<='1';c_Ram<='1';c_Read<='0';
	when S4 => Addr<="11";c_Rom<='1';c_Ram<='1';c_Read<='0';
	when S5 => Addr<="00";c_Rom<='0';c_Ram<='0';c_Read<='1';
	when S6 => Addr<="01";c_Rom<='0';c_Ram<='0';c_Read<='1';
	when S7 => Addr<="10";c_Rom<='0';c_Ram<='0';c_Read<='1';
	when S8 => Addr<="11";c_Rom<='0';c_Ram<='0';c_Read<='1';
	end case;
end Process Output;
end Behave;