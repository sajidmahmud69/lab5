----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity ACU is
 Port ( I_ACU_ALUOp : in  STD_LOGIC_VECTOR (1 downto 0);
        I_ACU_Funct : in  STD_LOGIC_VECTOR (5 downto 0);
           O_ACUCTL : out  STD_LOGIC_VECTOR (3 downto 0));
end ACU;

architecture Behavioral of ACU is

begin

	process(I_ACU_ALUOp,I_ACU_Funct)
	begin
		case I_ACU_ALUOp is
				when "00" => O_ACUCTL <="0010";
				when "01" => O_ACUCTL	<="0110";
				when others => 
				case I_ACU_Funct is 
								when "100000" => O_ACUCTL <=
									"0010";
								when "100010" => O_ACUCTL<= 
									"0110";
								when "100100" => O_ACUCTL <=
									"0000";
								when "100101" => O_ACUCTL <=
									"0001";
								when "101010" => O_ACUCTL<=
									"0111";
								when others => O_ACUCTL <=
									"----";
							end case;
		end case;
	end process;
end Behavioral;
