library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity part1 is
	port(	clk,rst:in std_logic;
			vector :in bit_vector(6 downto 0);
			byte :in std_logic_vector(7 downto 0);
			r4: out integer;
			r3: out integer;
			r2: out integer;
			r1 :out bit);
end entity;


architecture arch of part1 is
	signal a: bit_vector(6 downto 0):=(others=>'0');
	signal b: bit_vector(7 downto 0):=(others=>'0');
	

function parity(a: in bit_vector(6 downto 0)) return bit is
	variable count : integer range 0 to 7:=0;
	begin
		for i in 0 to 6 loop
			if(a(i)='1') then count:=count+1; end if;
		end loop;
		if((count mod 2)=0) then return '0' ; else return '1'; end if;
end parity;

function numberof1(a: in bit_vector(6 downto 0)) return integer is
	variable count : integer range 0 to 7:=0;
	begin
		for i in 0 to 6 loop
			if(a(i)='1') then count:=count+1; end if;
		end loop;
		return count;
end numberof1;



function numberOfTrailing0s(b: in std_logic_vector(7 downto 0)) return integer is
	variable count : integer range 0 to 7:=0;
	variable nbr : integer range 0 to 7:=0;
	
	begin
		for i in 7 downto 0 loop
			if(b(i)='0') then 
				for j in i downto 0 loop
				if(b(j)='0') then count:=count+1; end if; 
				end loop;
				if(count=i) then nbr:=nbr+1; end if;
			end if;
		end loop;
		return nbr;
end numberOfTrailing0s;



begin 

	process(clk,rst) is
	
	begin 
	if(rst='1') then r1<='0';r2<=0;r3<=0;r4<=0;

	elsif(clk'event and clk='1') then 
		r1<= parity(vector);
		r2<= numberof1(vector);
		
		r4<= numberOfTrailing0s(byte);
		 
	end if;
	
	
	end process;
	
end arch;

		