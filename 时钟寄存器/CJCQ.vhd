library ieee;
use ieee.std_logic_1164.all;
entity CJCQ is
port(
	ENN:in std_logic;
	EN0:out std_logic);
end CJCQ;
architecture test of CJCQ is
signal CL:std_logic;
begin
	process(ENN)
	begin
	   if(ENN='0') then
	   EN0<='1';
	   else 
	   EN0<='0';
	   end if;
	end process;
end test;