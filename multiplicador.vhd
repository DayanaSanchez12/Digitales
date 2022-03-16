LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_arith.all;
-------------------------------------------------------
ENTITY multiplicador IS
	PORT(		input_A		:	IN			STD_LOGIC_VECTOR (7 DOWNTO 0);
				input_B		:	IN			STD_LOGIC_VECTOR (7 DOWNTO 0);
				S2				:	OUT		STD_LOGIC_VECTOR (7 DOWNTO 0));
END ENTITY multiplicador;
-------------------------------------------------------
ARCHITECTURE functional OF multiplicador IS
		SIGNAL p0: STD_LOGIC_VECTOR (7 DOWNTO 0):= (others=>'0');
		SIGNAL p1: STD_LOGIC_VECTOR (7 DOWNTO 0):= (others=>'0');
		SIGNAL p2: STD_LOGIC_VECTOR (7 DOWNTO 0):= (others=>'0');
		SIGNAL p3: STD_LOGIC_VECTOR (7 DOWNTO 0):= (others=>'0');
		SIGNAL p4: STD_LOGIC_VECTOR (7 DOWNTO 0):= (others=>'0');
		SIGNAL p5: STD_LOGIC_VECTOR (7 DOWNTO 0):= (others=>'0');
		SIGNAL p6: STD_LOGIC_VECTOR (7 DOWNTO 0):= (others=>'0');
		SIGNAL p7: STD_LOGIC_VECTOR (7 DOWNTO 0):= (others=>'0');
		SIGNAL p8: STD_LOGIC_VECTOR (8 DOWNTO 0):= (others=>'0');
BEGIN
		primerafila:FOR j IN 0 TO 3 GENERATE
		p0(j)<= input_A(j) AND input_B(0);
		END GENERATE;
		--Segunda fila
		p1(1)<= input_A(0) AND input_B(1);
		p1(2)<= input_A(1) AND input_B(1);
		p1(3)<= input_A(2) AND input_B(1);
		p1(4)<= input_A(3) AND input_B(1);
		--Tercera fila
		p2(2)<= input_A(0) AND input_B(2);
		p2(3)<= input_A(1) AND input_B(2);
		p2(4)<= input_A(2) AND input_B(2);
		p2(5)<= input_A(3) AND input_B(2);
		--cuarta fila
		p3(3)<= input_A(0) AND input_B(3);
		p3(4)<= input_A(1) AND input_B(3);
		p3(5)<= input_A(2) AND input_B(3);
		p3(6)<= input_A(3) AND input_B(3);
	
		dosfilas: FOR o IN 0 TO 5 GENERATE
		Sum: ENTITY work.adder
		PORT MAP (
			input_A      => p0(o),
			input_B      => p1(o),
			input_Cin	 => p6(o),
			S	   		 => p4(o),
			Cout			 => p6(o+1));			
		END GENERATE;
		dosfilassum: FOR u IN 0 TO 6 GENERATE
		Sum: ENTITY work.adder
		PORT MAP (
			input_A      => p4(u),
			input_B      => p2(u),
			input_Cin	 => p7(u),
			S	   		 => p5(u),
			Cout			 => p7(u+1));			
		END GENERATE;
		dosfilassum1: FOR r IN 0 TO 7 GENERATE
		Sum: ENTITY work.adder
		PORT MAP (
			input_A      => p5(r),
			input_B      => p3(r),
			input_Cin	 => p8(r),
			S	   		 => S2(r),
			Cout			 => p8(r+1));			
		END GENERATE;
END;
