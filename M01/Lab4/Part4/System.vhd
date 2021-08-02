Library ieee;
use ieee.std_logic_1164.all;

Entity System is
Port(clk,Reset:IN std_logic;
	Data_Read: Out std_logic_vector(7 downto 0));
end Entity;

Architecture structural of System is
signal c_Rom,c_Ram,c_Read: std_logic;
signal Addr: std_logic_vector(1 downto 0);
signal Data: std_logic_vector(7 downto 0);

Component ROM is
	port(clk,RD:IN std_logic;
		Addr:IN std_logic_vector(1 downto 0);
		Dout:Out std_logic_vector(7 downto 0));
	end component;
Component RAM is
	port(clk,RD,WE:IN std_logic;
		Addr:IN std_logic_vector(1 downto 0);
		Din:IN std_logic_vector(7 downto 0);
		Dout:Out std_logic_vector(7 downto 0));
	end component;
Component FSM is
	port(clk,Reset:IN std_logic;
		Addr:Out std_logic_vector(1 downto 0);
		c_Rom,c_Ram,c_Read:OUT std_logic);
	end component;
Begin
FSMc: FSM port map(clk,Reset,Addr,c_Rom,c_Ram,c_Read);
ROMc: ROM port map(clk,c_Rom,Addr,Data);
RAMc: RAM port map(clk,c_Read,c_Ram,Addr,Data,Data_Read);
end structural ;

