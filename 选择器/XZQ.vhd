library ieee;
use ieee.std_logic_1164.all;
entity XZQ is
port(
	MADD:in std_logic_vector(1 downto 0);
	A,B,C:in std_logic_vector(7 downto 0);
	OUT1:out std_logic_vector(7 downto 0)
);
end XZQ;
architecture test of XZQ is
begin
	process(MADD)
	begin
		if(MADD="00")then
		OUT1<=A;
		elsif(MADD="01")then
		OUT1<=B;
		elsif(MADD="10")then
		OUT1<=C;
		end if;
	end process;
end test;