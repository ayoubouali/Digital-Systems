library ieee;
use ieee.std_logic_1164.all;

entity TDM is
port(clk : in std_logic ;
		f: in std_logic_vector(3 downto 0);
		q: out std_logic_vector(1 downto 0);
		y: out std_logic);
end TDM;

architecture behav of TDM is
signal state: std_logic_vector(1 downto 0);

begin

count: process(clk,state)
		begin
		-----if (clk'event and clk='0') then state<=state+1; end if;
		end process count;

mux: process(state)
		begin
		case state is
			when "00" => y<= f(0);
			when "01" => y<= f(1);
			when "10" => y<= f(2);
			when others => y<= f(3);
		end case; 
		end process mux;
q<= state;

end behav;