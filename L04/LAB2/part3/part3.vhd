library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned;

entity bcd_adder is
port(a,b : in std_logic_vector(3 downto 0);
	 cin : in std_logic;
	 sum : out std_logic_vector(3 downto 0);
	 cd  : out std_logic);   
end bcd_adder;

architecture arch of bcd_adder is
signal result : std_logic_vector(4 downto 0);
begin 
process(a,b,cin)
begin
result<= ('0' & a) + b + cin ;
if result>9 then sum<= result(3 downto 0)+6;  cd<='1';
else sum<= result(3 downto 0);  cd<='0';
end if;
end process;

end arch;