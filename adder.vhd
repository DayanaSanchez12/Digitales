-------------------------------------------------------
-- oneBitEquality compares two bits to determine if the value
-- that they hold is equal. The output bit eq is set if the
-- inputs are holdeing the same value.
-------------------------------------------------------
LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------------------------
ENTITY adder IS
	PORT(		Input_A		:	IN		STD_LOGIC;
			Input_B		:	IN		STD_LOGIC;
			Input_Cin	:	IN		STD_LOGIC;
			S		:	OUT		STD_LOGIC;
			Cout		: 	OUT		STD_LOGIC);
END ENTITY adder;
-------------------------------------------------------
ARCHITECTURE gateLevel OF adder IS
	SIGNAL p0	: STD_LOGIC;
	SIGNAL p1	: STD_LOGIC;
	SIGNAL P2	: STD_LOGIC;
	SIGNAL p3	: STD_LOGIC;
	SIGNAL p4	: STD_LOGIC;
	SIGNAL p5	: STD_LOGIC;
	SIGNAL P6	: STD_LOGIC;
	SIGNAL p7	: STD_LOGIC;
	-------------------------------------------------------
BEGIN 
	--sum of products
	residue: S<= p0 or p1 or p2 or p3;
	sumOfProducts:	Cout<=p4 or p5 or p6 or p7;
	
	-- Product terms
	bothHigh: 	p0	<= input_A AND (NOT input_B) AND (NOT input_Cin);
	bothLow:  	p1	<= (NOT input_A) AND input_B AND (NOT input_Cin);
	both:		p2	<= (NOT input_A) AND (NOT input_B) AND input_Cin;
	both2:	 	p3	<= input_A AND input_B AND input_Cin;
	bothHigh1: 	p4	<= input_A AND (NOT input_B) AND input_Cin;
	bothLow2:  	p5	<= (NOT input_A) AND input_B AND  input_Cin;
	both12:	 	p6	<= input_A AND input_B AND (NOT input_Cin);
	both3:	 	p7	<= input_A AND input_B AND input_Cin;

END ARCHITECTURE gateLevel;
