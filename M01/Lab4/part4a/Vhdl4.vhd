Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity part4 is
port( clk,rst: in std_logic;
		dout: out std_logic_vector(7 downto 0));
end entity;

architecture arch of part4 is
signal data: std_logic_vector(7 downto 0);
signal Addr: std_logic_vector(1 downto 0);
signal c_Rom,c_Ram,c_Read:  std_logic;

component FSM is
Port(Clk,Reset: IN std_logic;
	Addr:Out std_logic_vector(1 downto 0);
	c_Rom,c_Ram,c_Read: OUT std_logic);
End component;

component RAM is
Port(Clk,RD,WE: IN std_logic;
	 Addr: IN std_logic_vector(1 downto 0);
	 Din: IN std_logic_vector(7 downto 0);
	 Dout: OUT std_logic_vector(7 downto 0));
end component;

component ROM is
Port(Clk,RD: IN std_logic;
	 Addr: IN std_logic_vector(1 downto 0);
	 Dout: OUT std_logic_vector(7 downto 0));
end component;

begin

F: FSM port map(clk,rst,Addr,c_Rom,c_Ram,c_Read);
R1: ROM port map(clk,c_Rom,Addr,data);
R2: RAM port map(clk,c_Read,c_Ram,Addr,data,dout);

end arch;




