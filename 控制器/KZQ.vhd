library ieee;
use ieee.std_logic_1164.all;
entity KZQ is
port(
	MOVA,MOVB,MOVC,ADD,SUB,OR1,NOT1,RSR,RSL,JMP,JZ,JC,IN1,OUT1,NOP,HALT,C,Z,SM:in std_logic;
	ENN,LDIR,DL,CS,XL,LDPC,INPC,FBUS,FLBUS,FRBUS,M,WE:out std_logic;
	MADD:out std_logic_vector(1 downto 0)
);
end KZQ;
architecture tt of KZQ is
begin
	LDIR<='1' when (SM='1') 
	else '0';
	DL<='1' when (SM='1' or JMP='1' or MOVC='1' or (JZ='1' and Z='1') or (JC='1' and C='1')) 
	else '0';
	XL<='1' when MOVB='1' 
	else '0';
	CS<='1' when (SM='1' or JMP='1' or MOVC='1' or MOVB='1' or (JZ='1' and Z='1') or (JC='1' and C='1')) 
	else '0';
	LDPC<='1' when (JMP='1' or (JZ='1' and Z='1') or (JC='1' and C='1')) 
	else '0';
	INPC<='1' when (SM='1' or (JC='1' and C='0') or (JZ='1' and Z='0') or NOP='1') 
	else '0';
	FBUS<='1' when (MOVA='1' or MOVB='1' or ADD='1' or SUB='1' or OR1='1' or NOT1='1' or RSR='1' or RSL='1') 
	else '0';
	FLBUS<='1' when (RSL='1') 
	else '0';
	FRBUS<='1' when (RSR='1') 
	else '0';
	M<='1' when (OR1='1' or NOT1='1' or IN1='1' or OUT1='1') 
	else '0';
	WE<='1' when (SM='1' or MOVB='1' or OUT1='1' or NOP='1' or HALT='1' or JMP='1' or JZ='1' or JC='1') 
	else '0';
	MADD<="00" when (SM='1' or JMP='1' or JZ='1' or JC='1') 
	else
			"01" when (MOVC='1') 
			else
			"10" when (MOVB='1');
	ENN<='0' when (HALT='0') 
	else '1';
end tt;