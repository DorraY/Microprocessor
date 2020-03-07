----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:26:31 01/21/2020 
-- Design Name: 
-- Module Name:    RI - arch_RI 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.up_pack.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RI is
    Port ( clk : in  STD_LOGIC;
           raz : in  STD_LOGIC;
           load : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           data_out : out  STD_LOGIC_VECTOR (11 downto 0);
			  opcode : out OPCODE);
end RI;

architecture arch_RI of RI is
 signal interne :  std_logic_vector(3 downto 0);
begin 

	process(raz,clk,load)
	begin
	if (raz='1') then
		interne <= "0000";
		data_out <= "000000000000";
	elsif (rising_edge(clk)) then
		if (load='1') then
			interne <= data_in(15 downto 12);
			data_out <= data_in(11 downto 0);
		end if;
	end if;
	
		end process;

opcode <= OP_LDA when interne="0000" else
          OP_STO when interne="0001" else
          OP_ADD when interne="0010" else
          OP_SUB when interne="0011" else
          OP_JMP when interne="0100" else
          OP_JGE when interne="0101" else
          OP_JNE when interne="0110" else
          OP_STP when interne="0111" else
          OP_AND when interne="1000" else
          OP_OR  when interne="1001" else
          OP_XOR when interne="1010" else
          OP_LDR when interne="1011" else
          OP_LDI when interne="1100" else
          OP_STI when interne="1101" else               
          OP_JSR when interne="1110" else
          OP_RET when interne="1111" else
          OP_UNKNOWN;
 
end arch_RI;

