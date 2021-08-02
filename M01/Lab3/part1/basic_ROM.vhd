Library ieee;
use ieee.std_logic_1164.all;

Entity basic_ROM is
port(
	addr: in std_logic_vector(3 downto 0);
	data: out std_logic_vector(6 downto 0));
end entity;

Architecture behav of basic_ROM is
begin 
	process(addr)
	begin 
		case addr is
	when "0000"=> data<="1000000";--'0'
	when "0001"=> data<="1111001";--'1'
	when "0010"=> data<="0100100";--'2'
	when "0011"=> data<="0110000";--'3'
	when "0100"=> data<="0011001";--'4'
	when "0101"=> data<="0010010";--'5'
	when "0110"=> data<="0000010";--'6'
	when "0111"=> data<="1111000";--'7'
	when "1000"=> data<="1111111";--'8'
	when "1001"=> data<="0010000";--'9'
	when "1010"=> data<="0100000";--'a'
	when "1011"=> data<="0000011";--'b'
	when "1100"=> data<="0100111";--'c'
	when "1101"=> data<="0100001";--'d'
	when "1110"=> data<="0000110";--'E'
	when "1111"=> data<="0001110";--'F'
		end case;
	end process;
end behav;

