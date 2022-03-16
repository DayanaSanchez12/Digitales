LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;
-------------------------------------------------------
ENTITY sumres IS
	GENERIC(	bits			:	INTEGER	:=	8;
				long			:	INTEGER	:=	7;
				times			:	INTEGER	:= 6);
	PORT(		input_A		:	IN			STD_LOGIC_VECTOR (bits-1 DOWNTO 0);
				input_B		:	IN			STD_LOGIC_VECTOR (bits-1 DOWNTO 0);
				op				:	IN			STD_LOGIC;
				elec			:	IN			STD_LOGIC;
				S1				:	OUT		STD_LOGIC_VECTOR (long DOWNTO 0));
END ENTITY sumres;
-------------------------------------------------------
ARCHITECTURE functional OF sumres IS
		SIGNAL p0: STD_LOGIC_VECTOR (bits   DOWNTO 0);
		SIGNAL p1: STD_LOGIC_VECTOR (bits-1	DOWNTO 0) := (others=>'1');
		SIGNAL p2: STD_LOGIC_VECTOR (bits-1 DOWNTO 0);
BEGIN

		p0(0)	<= '1' WHEN op='0' ELSE
					'0';
		p2		<=	p1 XOR input_B WHEN op='0' ELSE
					input_B;
		S1(long)	<= '1' WHEN op='0' AND input_A<input_B AND elec='0' ELSE
						'0';
		generador:FOR i IN 0 TO times GENERATE
		Sum: ENTITY work.adder
		PORT MAP (
			input_A      => Input_A(i),
			input_B      => p2(i),
			input_Cin	 => p0(i),
			S	   		 => S1(i),
			Cout			 => p0(i+1));			
		END GENERATE;
END;
