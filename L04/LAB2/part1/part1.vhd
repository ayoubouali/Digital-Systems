--AND
library ieee;
use ieee.std_logic_1164.all;

entity andgate is 
port( a,b : in std_logic;
		c : out std_logic); 
end andgate;

architecture arch of andgate is 
begin 
c<= a and b;
end arch;

--COMPARATOR
library ieee;
use ieee.std_logic_1164.all;

entity compar is
port(c1,c2 : in std_logic;
	gr,eq,sm : out std_logic); 
end compar;

architecture arch of compar is 
signal result: std_logic_vector(2 downto 0);
begin
process(c1,c2)
begin 
if c1>c2 then result<="100";
elsif c1=c2 then result<="010";
elsif c1<c2 then result<="001";
end if;
end process;

gr<= result(2);
eq<= result(1);
sm<= result(0);

end arch;

--FULL ADDER
library ieee;
use ieee.std_logic_1164.all;

entity FA is
port(c1,c2,c_in : in std_logic;
	 sum,c_out : out std_logic);
end FA;

architecture arch of FA is
begin 
sum<= c1 XOR c2 XOR c_in;
c_out<= (c1 and c2) or (c_in and (c1 XOR c2));

end arch;



--CIRCUIT
library ieee;
use ieee.std_logic_1164.all;

entity part1 is 
port( a,s,b,cin : in std_logic;
		G,E,L,sum,cout : out std_logic); 
end part1;

architecture arch of part1 is
--AND
component andgate 
port(a,b : in std_logic;
		c : out std_logic);
end component;

--COMPARATOR
component compar 
port(c1,c2 : in std_logic;
		gr,eq,sm : out std_logic);
end component;

--Full Adder
component FA 
port(c1,c2,c_in : in std_logic;
	 sum,c_out : out std_logic);
end component;

signal x1,x2,x3 : std_logic; 
 
begin 

unit1: entity work.andgate port map(a,s,x1);
unit2: entity work.andgate port map(b,s,x2);
unit3: entity work.andgate port map(cin,s,x3);
unit4: entity work.compar port map(x1,x2,G,E,L);
unit5: entity work.FA port map(x1,x2,x3,sum,cout);


end arch;

