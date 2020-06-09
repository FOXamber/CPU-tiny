library ieee;
use ieee.std_logic_1164.all;
entity SCQ is
port(
	C,Z,JZ,JC,SM,clk:in std_logic;
	CQ,ZQ:out std_logic);
end SCQ;
architecture zz of SCQ is
signal X,Y:std_logic;
begin
	process(JZ,JC,C,Z)
	begin
		if(clk'event and clk='1')then
			if(SM='0')then
				X<=C;
				Y<=Z;
			end if;
		end if;
	end process;
	CQ<=X;
	ZQ<=Y;
end zz;