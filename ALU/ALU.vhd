library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity ALU is
port(
	R1,R2,IN0:in std_logic_vector(7 downto 0);
	S:in std_logic_vector(3 downto 0);
	M,FBUS,FLBUS,FRBUS:in std_logic;
	Q:out std_logic_vector(7 downto 0);
	C,Z:out std_logic
);
end entity ALU;
architecture tt of ALU is
signal ZZ:std_logic_vector(8 downto 0);
begin
	process(S,R1,R2,FBUS)
	begin
		if(M='1')then
			if(S="1011") then
				ZZ<='0'&(R1 or R2);
				--OR
			elsif(S="0101") then
				ZZ<='0'&not(R1);
				--NOT
			elsif(S="0010") then
			    ZZ<='0'&IN0;
			    --IN1
		    elsif(S="0100") then
			    ZZ<='0'&R1;
			    --OUT1
			end if;
		elsif(FBUS='1')then
			if(FRBUS='1')then
				ZZ<=R1(0)&R1(0)&R1(7 downto 1);
				--RSR
			elsif(FLBUS='1')then
				ZZ<=R1(7)&R1(6 downto 0)&R1(7);
				--RSL
			end if;
			if(S="1001") then
				ZZ<='0'&R1+('0'&R2);
				--ADD
			elsif(S="0110") then
				ZZ<='0'&R1-('0'&R2);
				--SUB
			elsif(S="1111")then
				ZZ<='0'&R2;
				--MOV
			end if;
		elsif(FBUS='0')then
			ZZ<="0ZZZZZZZZ";
		end if;
		if(zz(7 downto 0)="00000000")then
			Z<='1';
		else
			Z<='0';
		end if;
	end process;
	Q<=ZZ(7 downto 0);
	C<=ZZ(8);
end architecture tt;