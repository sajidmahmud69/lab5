----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity DEC is
port(
I_DEC_EN : in STD_LOGIC;
I_DEC_OPCODE: in STD_LOGIC_VECTOR(5 downto 0);
O_DEC_REGDST : out STD_LOGIC;
O_DEC_JUMP : out STD_LOGIC;
O_DEC_BEQ : out STD_LOGIC;
O_DEC_BNE : out STD_LOGIC;
O_DEC_MEMREAD : out STD_LOGIC;
O_DEC_MEMTOREG : out STD_LOGIC;
O_DEC_ALUOP : out STD_LOGIC_VECTOR(1 downto 0);
O_DEC_MEMWRITE : out STD_LOGIC;
O_DEC_ALUSRC: out STD_LOGIC;
O_DEC_REGWRITE: out STD_LOGIC
);
end DEC;

architecture Behavioral of DEC is
begin

	O_DEC_REGDST <= 	   '1' when (I_DEC_OPCODE="000000"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="001000"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="000100"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="000101"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="000010"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="100011"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="101011"  and I_DEC_EN='1') else '0';
								
	O_DEC_JUMP <=			'0' when (I_DEC_OPCODE="000000"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="001000"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="000100"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="000101"  and I_DEC_EN='1') else 
								'1' when (I_DEC_OPCODE="000010"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="100011"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="101011"  and I_DEC_EN='1') else '0';
								
	O_DEC_BEQ <=		   '0' when (I_DEC_OPCODE="000000"  and I_DEC_EN='1') else
								'1' when (I_DEC_OPCODE="001000"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="000100"  and I_DEC_EN='1') else 
								'1' when (I_DEC_OPCODE="000101"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="000010"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="100011"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="101011"  and I_DEC_EN='1') else '0';
								
	O_DEC_BNE <=		   '0' when (I_DEC_OPCODE="000000"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="001000"  and I_DEC_EN='1') else 
								'1' when (I_DEC_OPCODE="000100"  and I_DEC_EN='1') else 
								'1' when (I_DEC_OPCODE="000101"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="000010"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="100011"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="101011"  and I_DEC_EN='1') else '0';
								
	O_DEC_MEMREAD <=		'0' when (I_DEC_OPCODE="000000"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="001000"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="000100"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="000101"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="000010"  and I_DEC_EN='1') else 
								'1' when (I_DEC_OPCODE="100011"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="101011"  and I_DEC_EN='1') else '0';
								
	O_DEC_MEMTOREG <= 	'0' when (I_DEC_OPCODE="000000"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="001000"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="000100"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="000101"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="000010"  and I_DEC_EN='1') else 
								'1' when (I_DEC_OPCODE="100011"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="101011"  and I_DEC_EN='1') else '0';
								
	O_DEC_MEMWRITE <= 	'0' when (I_DEC_OPCODE="000000"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="001000"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="000100"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="000101"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="000010"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="100011"  and I_DEC_EN='1') else 
								'1' when (I_DEC_OPCODE="101011"  and I_DEC_EN='1') else '0';
								
	O_DEC_ALUSRC <= 		'0' when (I_DEC_OPCODE="000000"  and I_DEC_EN='1') else 
								'1' when (I_DEC_OPCODE="001000"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="000100"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="000101"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="000010"  and I_DEC_EN='1') else 
								'1' when (I_DEC_OPCODE="100011"  and I_DEC_EN='1') else 
								'1' when (I_DEC_OPCODE="101011"  and I_DEC_EN='1') else '0';
								
	O_DEC_REGWRITE <= 	'1' when (I_DEC_OPCODE="000000"  and I_DEC_EN='1') else 
								'1' when (I_DEC_OPCODE="001000"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="000100"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="000101"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="000010"  and I_DEC_EN='1') else 
								'1' when (I_DEC_OPCODE="100011"  and I_DEC_EN='1') else 
								'0' when (I_DEC_OPCODE="101011"  and I_DEC_EN='1') else '0';
								
	O_DEC_ALUOP <= 	   "10" when (I_DEC_OPCODE="000000"  and I_DEC_EN='1')else 
								"00" when (I_DEC_OPCODE="001000"  and I_DEC_EN='1')else 
								"01" when (I_DEC_OPCODE="000100"  and I_DEC_EN='1')else 
								"11" when (I_DEC_OPCODE="000101"  and I_DEC_EN='1')else 
								"00" when (I_DEC_OPCODE="000010"  and I_DEC_EN='1')else 
								"00" when (I_DEC_OPCODE="100011"  and I_DEC_EN='1') else 
								"00" when (I_DEC_OPCODE="101011"  and I_DEC_EN='1') else "00";
	
end Behavioral;
