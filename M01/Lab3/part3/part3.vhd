Library ieee;
use ieee.std_logic_1164.all;

Entity part3 is
port(
	CS,RW: in std_logic;
	addr: in integer range 0 to 31;
	data_in : in std_logic_vector(3 downto 0);
	data_out : out std_logic_vector(3 downto 0));
end entity;

Architecture behav of part3 is

Type ram_array is Array (0 to 31) of std_logic_vector(3 downto 0);
signal ram: ram_array;

begin 
	process(addr,CS,RW)
	begin 
	
	if CS='1' then data_out<=(others=>'Z');
	elsif RW='0' then data_out<=ram(addr);
	elsif RW='1' then 	
				ram(addr)<=data_in;
				data_out<=(others=>'Z');
	end if;
	end process;
	
end behav;
