--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY TEST_MODULE IS
PORT (
			
         O_REGDST : OUT  std_logic;
         O_JUMP : OUT  std_logic;
         O_BEQ : OUT  std_logic;
         O_BNE : OUT  std_logic;
         O_MEMREAD : OUT  std_logic;
         O_MEMTOREG : OUT  std_logic;
         O_MEMWRITE : OUT  std_logic;
         O_ALUSRC : OUT  std_logic;
         O_REGWRITE : OUT  std_logic;
         O_ALUCTL : OUT  std_logic_vector(3 downto 0)

);
END TEST_MODULE;
 
ARCHITECTURE behavior OF TEST_MODULE IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DEC
    PORT(
         I_DEC_EN : IN  std_logic;
         I_DEC_OPCODE : IN  std_logic_vector(5 downto 0);
         O_DEC_REGDST : OUT  std_logic;
         O_DEC_JUMP : OUT  std_logic;
         O_DEC_BEQ : OUT  std_logic;
         O_DEC_BNE : OUT  std_logic;
         O_DEC_MEMREAD : OUT  std_logic;
         O_DEC_MEMTOREG : OUT  std_logic;
         O_DEC_ALUOP : OUT  std_logic_vector(1 downto 0);
         O_DEC_MEMWRITE : OUT  std_logic;
         O_DEC_ALUSRC : OUT  std_logic;
         O_DEC_REGWRITE : OUT  std_logic
        );
    END COMPONENT;
    
	  
    COMPONENT ACU
 PORT( 
			I_ACU_ALUOp : in  STD_LOGIC_VECTOR (1 downto 0);
         I_ACU_Funct : in  STD_LOGIC_VECTOR (5 downto 0);
         O_ACUCTL : out  STD_LOGIC_VECTOR (3 downto 0)
			);
    END COMPONENT;

   --Inputs
   signal I_DEC_EN : std_logic := '0';
	signal	I_EN :   std_logic:= '0';
	signal   I_INSTR :   std_logic_vector(31 downto 0):=(others=>'0');

 	--Outputs

   signal O_DEC_ALUOP : std_logic_vector(1 downto 0);
	
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut_DEC: DEC PORT MAP (
          I_DEC_EN => I_EN,
          I_DEC_OPCODE => I_INSTR(31 downto 26),
          O_DEC_REGDST => O_REGDST,
          O_DEC_JUMP => O_JUMP,
          O_DEC_BEQ => O_BEQ,
          O_DEC_BNE => O_BNE,
          O_DEC_MEMREAD => O_MEMREAD,
          O_DEC_MEMTOREG => O_MEMTOREG,
          O_DEC_ALUOP => O_DEC_ALUOP,
          O_DEC_MEMWRITE => O_MEMWRITE,
          O_DEC_ALUSRC => O_ALUSRC,
          O_DEC_REGWRITE => O_REGWRITE
        );

	
   uut_ACU: ACU PORT MAP (
          I_ACU_ALUOp => O_DEC_ALUOP,
          I_ACU_Funct => I_INSTR(5 downto 0),
          O_ACUCTL => O_ALUCTL
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		I_INSTR<=X"00123A00";
      wait for 100 ns;	
		I_EN<='1';
		
      wait for 100 ns;	
		I_INSTR<=X"00123A00";
      wait for 100 ns;	
		I_INSTR<=X"20123A00";
      wait for 100 ns;	
		I_INSTR<=X"10123A00";
      wait for 100 ns;	
		I_INSTR<=X"14123A00";
      wait for 100 ns;	
		I_INSTR<=X"08123A00";
      wait for 100 ns;	
		I_INSTR<=X"8C123A00";
      wait for 100 ns;	
		I_INSTR<=X"AC123A00";
      wait for 100 ns;	
		I_INSTR<=X"20123A00";
		
      wait for 100 ns;	
		I_INSTR<=X"00123A20";
      wait for 100 ns;	
		I_INSTR<=X"20123A22";
      wait for 100 ns;	
		I_INSTR<=X"10123A24";
      wait for 100 ns;	
		I_INSTR<=X"14123A25";
      wait for 100 ns;	
		I_INSTR<=X"08123A2A";
      wait for 100 ns;	
		I_INSTR<=X"8C123A20";
      wait for 100 ns;	
		I_INSTR<=X"AC123A22";
      wait for 100 ns;	
		I_INSTR<=X"20123A2A";

      -- insert stimulus here 

      wait;
   end process;


END;
