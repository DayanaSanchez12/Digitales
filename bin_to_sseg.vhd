LIBRARY ieee;
USE ieee.std_logic_1164.all;
-------------------------------------------------
ENTITY bin_to_sseg IS
PORT(
		bin	  : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		sseg   	  : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END bin_to_sseg;		
ARCHITECTURE behaviour OF bin_to_sseg is
BEGIN
			WITH bin SELECT
sseg<=
			"1000000"	 WHEN "00000000",
			"1111001"	 WHEN "00000001",
			"0100100"	 WHEN "00000010",
			"0110000"	 WHEN "00000011",
			"0011001"	 WHEN "00000100",
			"0010010"	 WHEN "00000101",
			"0000010"	 WHEN "00000110",
			"1111000" 	 WHEN "00000111",
			"0000000" 	 WHEN "00001000",			
			"0010000" 	 WHEN "00001001",
			"0000110"	 WHEN OTHERS;
end behaviour;
