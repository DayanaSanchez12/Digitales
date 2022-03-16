LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------------------------
ENTITY entradas IS
	GENERIC(	EIGHT					:	INTEGER	:=	8;
				FOUR					:	INTEGER	:= 4);
	PORT(		Input_A				:	IN			STD_LOGIC_VECTOR (7 DOWNTO 0);
				Output1				:	OUT		STD_LOGIC_VECTOR (7 DOWNTO 0);
				Output2				:	OUT		STD_LOGIC_VECTOR (7 DOWNTO 0));
END ENTITY entradas;
-------------------------------------------------------
ARCHITECTURE functional OF entradas IS
	SIGNAL	 p0	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	 p1	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	 p2	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	 p3	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	 p4	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	 p5	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	 p6	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	 p7	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	 p8	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	 p9	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	 p10	: STD_LOGIC_VECTOR (6 DOWNTO 0);
	SIGNAL	 p11	: STD_LOGIC_VECTOR (6 DOWNTO 0);
	SIGNAL	 p12	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	 p13	: STD_LOGIC_VECTOR (7 DOWNTO 0);

BEGIN
	primercaso:FOR j IN 0 TO 7 GENERATE
	p0(j)<= Input_A(j);
	END GENERATE;
	
		R1:ENTITY work.sumres
		GENERIC MAP (
					bits	=> EIGHT)
				PORT MAP (
					input_A		=>	Input_A,
					input_B		=>	"00001010",
					op				=>	'0',
					elec			=>	'0',
					S1				=>	p1);
		R2:ENTITY work.sumres
			GENERIC MAP (
					bits	=> EIGHT)
				PORT MAP (
					input_A		=>	p1,
					input_B		=>	"00001010",
					op				=>	'0',
					elec			=>	'0',
					S1				=>	p2);
		R3:ENTITY work.sumres
		GENERIC MAP (
					bits	=> EIGHT)
				PORT MAP (
					input_A		=>	p2,
					input_B		=>	"00001010",
					op				=>	'0',
					elec			=>	'0',
					S1				=>	p3);
		R4:ENTITY work.sumres
		GENERIC MAP (
					bits	=> EIGHT)
					PORT MAP (
					input_A		=>	p3,
					input_B		=>	"00001010",
					op				=>	'0',
					elec			=>	'0',
					S1				=>	p4);
		R5:ENTITY work.sumres
			GENERIC MAP (
					bits	=> EIGHT)
					PORT MAP (
					input_A		=>	p4,
					input_B		=>	"00001010",
					op				=>	'0',
					elec			=>	'0',
					S1				=>	p5);
		R6:ENTITY work.sumres
				GENERIC MAP (
					bits	=> EIGHT)
					PORT MAP (
					input_A		=>	p5,
					input_B		=>	"00001010",
					op				=>	'0',
					elec			=>	'0',
					S1				=>	p6);
		R7:ENTITY work.sumres
			GENERIC MAP (
					bits	=> EIGHT)
					PORT MAP (
					input_A		=>	p6,
					input_B		=>	"00001010",
					op				=>	'0',
					elec			=>	'0',
					S1				=>	p7);
		R8:ENTITY work.sumres
				GENERIC MAP (
					bits	=> EIGHT)
					PORT MAP (
					input_A		=>	p7,
					input_B		=>	"00001010",
					op				=>	'0',
					elec			=>	'0',
					S1				=>	p8);
		R9:ENTITY work.sumres
				GENERIC MAP (
					bits	=> EIGHT)
					PORT MAP (
					input_A		=>	p8,
					input_B		=>	"00001010",
					op				=>	'0',
					elec			=>	'0',
					S1				=>	p9);
					
Output2<=		p0				WHEN p0<"00001010"	ElSE
					p1				WHEN p1<"00001010"	ElSE
					p2				WHEN p2<"00001010"	ElSE
					p3				WHEN p3<"00001010"	ElSE
					p4				WHEN p4<"00001010"	ElSE
					p5				WHEN p5<"00001010"	ElSE
					p6				WHEN p6<"00001010"	ElSE
					p7				WHEN p7<"00001010"	ElSE
					p8				WHEN p8<"00001010"	ElSE
					P9;
Output1<=	"00000000"		WHEN p0<"00001010"	ElSE
				"00000001"		WHEN p1<"00001010"	ElSE
				"00000010"		WHEN p2<"00001010"	ElSE
				"00000011"		WHEN p3<"00001010"	ElSE
				"00000100"		WHEN p4<"00001010"	ElSE
				"00000101"		WHEN p5<"00001010"	ElSE
				"00000110"		WHEN p6<"00001010"	ElSE
				"00000111"		WHEN p7<"00001010"	ElSE
				"00001000"		WHEN p8<"00001010"	ElSE
				"00001001";
	
	
					
END;
