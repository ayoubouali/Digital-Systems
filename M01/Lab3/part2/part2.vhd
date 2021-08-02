Library ieee;
use ieee.std_logic_1164.all;

Entity part2 is
port(
	OE,LT: in std_logic;
	addr: in integer range 0 to 15;
	data: out std_logic_vector(6 downto 0));
end entity;

Architecture behav of part2 is

Type rom_array is Array (0 to 15) of std_logic_vector(6 downto 0) ;
constant rom: rom_array:=(	"1000000",--'0'
							"1111001",--'1'
							"0100100",--'2'
							"0110000",--'3'
							"0011001",--'4'
							"0010010",--'5'
							"0000010",--'6'
							"1111000",--'7'
							"1111111",--'8'
							"0010000",--'9'
							"0100000",--'a'
							"0000011",--'b'
							"0100111",--'c'
							"0100001",--'d'
							"0000110",--'E'
							"0001110");--'F'

begin 
	process(addr,OE,LT)
	begin 
	
	if OE='1' then data<=(others=>'Z');
	elsif LT='0' then data<=(others=>'0');
	else
		data<=rom(addr);
	end if;
	end process;
	
end behav;
