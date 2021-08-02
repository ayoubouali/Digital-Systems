-- 4-bit ADDER
library ieee;
use ieee.std_logic_1164.all;


entity adder is
port(a,b : in std_logic_vector(3 downto 0);
	 cin : in std_logic;
	 sum : out std_logic_vector(3 downto 0));
end adder;

architecture arch of adder is
signal result : std_logic_vector(4 downto 0);
begin 
result<= ('0' & a) + b + cin ;
sum<= result(3 downto 0);
end arch;

-- DETECTOR
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned;

entity detect is
port(a : in std_logic_vector(3 downto 0);
	 x : out std_logic);
end detect;

architecture arch of detect is
begin
process(a)
begin
if a>"0110" then x<='1';
else x<='0';
end if;
end process;

end arch;

--BCD ADDER
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned;

entity bcd is
port(a,b : in std_logic_vector(3 downto 0);
	 cin : in std_logic;
	 s : out std_logic_vector(3 downto 0);
	 cd : out std_logic);
end bcd;

architecture arch of bcd is

component adder is
port(c1,c2 : in std_logic_vector(3 downto 0);
	 c_in : in std_logic;
	 sumation : out std_logic_vector(3 downto 0));
end component;

component detect is
port(x : in std_logic_vector(3 downto 0);
	 y : out std_logic);
end component; 

signal sum: std_logic_vector(4 downto 0); 
signal six: std_logic_vector(3 downto 0);
signal x : std_logic;

begin
u1: adder port map(a,b,cin,sum);
u2: detect port map(sum,x);
cd<=x;
six(0)<='0';
six(1)<=x;
six(2)<=x;
six(3)<='0';
u3: adder port map(sum,six,'0',s);

end arch;












