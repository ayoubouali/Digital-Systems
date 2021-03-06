Library IEEE; 
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
Entity part5 is
	Port(w,Rst,clk:in std_logic;
		y:out std_logic_vector(6 downto 0));
End Entity;

Architecture bhv of part5 is
TYPE State is (a,ab,b,bc,c,cd,d,de,e,ef,f,fa);
signal ps:State;
signal Counter: std_logic_vector(26 downto 0);
Begin
Process (clk,Rst) is
Begin
	if Rst='1' Then ps <= a; Counter <= (others=>'0');
	Elsif Clk'event and Clk='0' Then
		Case ps is
When a => if Counter=50000000 Then Counter<=(others=>'0'); ps <= ab;
			Else Counter<=Counter+1; End if;
When ab => if Counter=25000000 Then Counter<=(others=>'0'); ps <= b;
			Else Counter<=Counter+1; End if;
When b => if Counter=50000000 Then Counter<=(others=>'0'); ps <= bc;
			Else Counter<=Counter+1; End if;
When bc => if Counter=25000000 Then Counter<=(others=>'0'); ps <= c;
			Else Counter<=Counter+1; End if;
When c => if Counter=50000000 Then Counter<=(others=>'0'); ps <= cd;
			Else Counter<=Counter+1; End if;
When cd => if Counter=25000000 Then Counter<=(others=>'0'); ps <= d;
			Else Counter<=Counter+1; End if;
When d => if Counter=50000000 Then Counter<=(others=>'0'); ps <= de;
			Else Counter<=Counter+1; End if;
When de => if Counter=25000000 Then Counter<=(others=>'0'); ps <= e;
			Else Counter<=Counter+1; End if;
When e => if Counter=50000000 Then Counter<=(others=>'0'); ps <= ef;
			Else Counter<=Counter+1; End if;
When ef => if Counter=25000000 Then Counter<=(others=>'0'); ps <= f;
			Else Counter<=Counter+1; End if;
When f => if Counter=50000000 Then Counter<=(others=>'0'); ps <= fa;
			Else Counter<=Counter+1; End if;
When fa => if Counter=25000000 Then Counter<=(others=>'0'); ps <= a;
			Else Counter<=Counter+1; End if;
			End Case;
		End if;
	End Process;
	y <= "1011111" when ps = a Else
		 "1001111" when ps = ab Else
		 "1101111" when ps = b Else
		 "1100111" when ps = bc Else
		 "1110111" when ps = c Else
		 "1110011" when ps = cd Else
		 "1111011" when ps = d Else
		 "1111001" when ps = de Else
		 "1111101" when ps = e Else
		 "1111100" when ps = ef Else
		 "1111110" when ps = f Else
		 "1011110" when ps = fa;
		
End;

