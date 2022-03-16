LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;
-------------------------------------------------------
ENTITY multiplexor IS
	GENERIC(	EIGHT					:	INTEGER	:=	8;
				FOUR					:	INTEGER	:= 4);
	PORT(		Input_A				:	IN			STD_LOGIC_VECTOR (3 DOWNTO 0);
				Input_B				:	IN			STD_LOGIC_VECTOR (3 DOWNTO 0);
				op						:	IN			STD_LOGIC;
				multi					:	IN			STD_LOGIC;
				A_dec  				:	OUT		STD_LOGIC_VECTOR (6 DOWNTO 0);
				B_dec  				:	OUT		STD_LOGIC_VECTOR (6 DOWNTO 0);
				neg_dec  			:	OUT		STD_LOGIC_VECTOR (6 DOWNTO 0);
				resultado			:	OUT		STD_LOGIC_VECTOR (6 DOWNTO 0));
END ENTITY multiplexor;
-------------------------------------------------------
ARCHITECTURE functional OF multiplexor IS
	SIGNAL	 p0	: STD_LOGIC_VECTOR (6 DOWNTO 0);
	SIGNAL	 p1	: STD_LOGIC_VECTOR (6 DOWNTO 0);
	SIGNAL	 p2	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	 p4	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	 p5	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	 p6	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	 p7	: STD_LOGIC_VECTOR (6 DOWNTO 0);
	SIGNAL	 p8	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	 p9	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	 p10	: STD_LOGIC_VECTOR (6 DOWNTO 0);
	SIGNAL	 p11	: STD_LOGIC_VECTOR (6 DOWNTO 0);
	SIGNAL	 p12	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	 p13	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	 p14	: STD_LOGIC_VECTOR (6 DOWNTO 0);
	SIGNAL	 p15	: STD_LOGIC_VECTOR (6 DOWNTO 0);
	SIGNAL	 p16	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	 p17	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	 p		: STD_LOGIC;
	
BEGIN
primernumero:FOR i IN 0 TO 3 GENERATE
		p16(i)<= Input_A(i);
		END GENERATE;
segundonumero:FOR i IN 0 TO 3 GENERATE
		p17(i)<= Input_B(i);
		END GENERATE;
--SE REALIZAN LAS DOS OPERACIONNES POSIBLES DEACUERDO A LA ENTRADA
 opcion1:ENTITY work.sumres
			PORT MAP (
				input_A		=>	P16,
				input_B		=>	P17,
				op				=>	op,
				elec			=>	'0',
				S1				=>	p4);
				
 opcion2:ENTITY work.multiplicador
			PORT MAP (
				input_A		=>	P16,
				input_B		=>	P17,
				S2				=>	p5	);

--SE EMPIEZA A VERIFICAR LOS DIGITOS Y A SELECCIONAR LOS DATOS
--QUE SALEN AL MULTIPLEXOR		
Primerdigito: 	ENTITY work.bin_to_sseg
					PORT MAP (
					bin	=> P16,
					sseg 	=> p0);
					A_dec <=p0;
Segundodigito: ENTITY work.bin_to_sseg
					PORT MAP (
					bin	=> P17,
					sseg 	=> p1);
					B_dec <=p1;
--PARA TERCER Y CUARTO DIGITO
Negativo: ENTITY work.sumres
				GENERIC MAP (
					bits	=> EIGHT)
				PORT MAP (
					input_A		=>	"00000000",
					input_B		=>	p4,
					op				=>	op,
					elec			=> '1',
					S1				=>	p6);
		primerafila:FOR j IN 0 TO 3 GENERATE
		p2(j)<= p6(j);
		END GENERATE;
Negativo2:	ENTITY work.bin_to_sseg
					PORT MAP (
					bin	=> p2,
					sseg 	=> p7);
Positivo1:ENTITY work.entradas
					PORT MAP (
				Input_A	=>	p4,	
				Output1	=>	p8,		--Decenas
				Output2	=>	p9);		--Unidades
	P21:ENTITY work.bin_to_sseg
					PORT MAP (
					bin	=> p8,
					sseg 	=> p10);	--Decenas en segmento
	P22:ENTITY work.bin_to_sseg
					PORT MAP (
					bin	=> p9,
					sseg 	=> p11);	--Unidades en segmento
Positivo2:ENTITY work.entradas
					PORT MAP (
				Input_A	=>	p5,	
				Output1	=>	p12, --Decenas multiplicacion
				Output2	=>	p13);--Unidades multiplicacion
	P23:ENTITY work.bin_to_sseg
					PORT MAP (
					bin	=> p12,
					sseg 	=> p14);--Decenas en segmento multiplicacion
	P24:ENTITY work.bin_to_sseg
					PORT MAP (
					bin	=> p13,
					sseg 	=> p15);--Unidades en segmento multiplicacion
	p	<=			'0'		 WHEN  p1="0000110"  ELSE
					'0'		 WHEN	 p0="0000110"	ELSE
					'1';
					
	neg_dec <=	"0111111" WHEN op='0' AND p4(7)='1' AND multi='1'AND p='1'ELSE
					"0111111" WHEN op='0' AND p4(5)='1' AND multi='1'AND p='1'ELSE
						p10	 WHEN			op='1'	AND 	multi='1'AND p='1'    ELSE
						p14	 WHEN				 multi='0' AND p='1'			       ELSE
					"0000110" WHEN				 		 p='0'					       ELSE
					"1000000";	
					
	resultado <=	p7 	 WHEN op='0'AND multi='1' 	AND p4(7)='1'AND p='1'ELSE
						p11	 WHEN        	multi='1' AND p4(7)='0'	AND p='1' ELSE
						p15	 WHEN	           multi='0' AND p='1' 		    	 ELSE
					"0000110" WHEN				 		 p='0'					       ELSE
					"1000000";	
END;