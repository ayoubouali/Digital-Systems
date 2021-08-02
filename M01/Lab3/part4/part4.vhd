Library ieee;
use ieee.std_logic_1164.all;

Entity part4 is
port(
	CS,RW,clk: in std_logic;
	addr: in integer range 0 to 15;
	data_in : in std_logic_vector(7 downto 0);
	data_out : out std_logic_vector(7 downto 0));
end entity;

Architecture behav of part4 is

Type ram_array is Array (0 to 15) of std_logic_vector(7 downto 0);
signal ram: ram_array;

begin 
	process(CS,clk)
	begin 
	
	if CS='1' then data_out<=(others=>'Z');
	elsif (clk'event and clk='1') then
	    if RW='0' then data_out<=ram(addr);  	
		else	ram(addr)<=data_in;
				data_out<=(others=>'Z');
	end if; end if;
	end process;
	
end behav;


