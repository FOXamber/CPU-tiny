library ieee;
use ieee.std_logic_1164.all;
entity TJ is
port(
	RAA1,RAA0,RWBA1,RWBA0,WE,clk,resect:in std_logic;
	BUSC:in std_logic_vector(7 downto 0);
	BUSA,BUSB:out std_logic_vector(7 downto 0));
end TJ;
architecture test of TJ is
signal A,B,C,OUTA,OUTB:std_logic_vector(7 downto 0);
signal S1,S2:std_logic_vector(1 downto 0);
begin
	S1<=RWBA1&RWBA0;		
	S2<=RAA1&RAA0;
	process(clk,resect,A,B,C,BUSC)
	begin
		if(resect='0')then
			A<="00000011";
			B<="00000010";
			C<="10000011";
		elsif(clk'event and clk='1')then
			if(WE='0')then
				if(S1="00")then
					A<=BUSC;
				elsif(S1="01")then
					B<=BUSC;
				elsif(S1="10")then
					C<=BUSC;
				end if;
			end if;
		end if;
	end process;
	BUSA<=A when S2="00" else
			B when S2="01" else
			C when S2="10" or S2="11";
	BUSB<=A when S1="00" else
			B when S1="01" else
			C when S1="10" or S1="11";
end test;