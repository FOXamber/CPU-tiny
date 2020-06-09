library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity JSQ is
port(
	LDPC,INPC,clk,reset:in std_logic;
	BUScin:in std_logic_vector(7 downto 0);
	BUSout:out std_logic_vector(7 downto 0)
);
end JSQ;
architecture test of JSQ is
signal Q:std_logic_vector(7 downto 0);
begin
	process(clk,reset)
	begin
		if(reset='0')then
		Q<="00000000";
		elsif(clk'event and clk='1')then
			if(LDPC='1')then
			Q<=BUScin;
			elsif(INPC='1')then
			Q<=Q+1;
			end if;
		end if;
	end process;
	BUSout<=Q;
end test;