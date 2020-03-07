----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:53:07 01/21/2020 
-- Design Name: 
-- Module Name:    UAL - arch_UAL 
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
use IEEE.STD_logic_UNSIGNED.ALL;

use IEEE.NUMERIC_STD.ALL;

entity UAL is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
			  alufs: in ALU_FACTS;
           S : out  STD_LOGIC_VECTOR (15 downto 0));
end UAL;

architecture arch_UAL of UAL is

begin

	process(A,B,alufs)
	begin

		case (alufs) is
			when ALU_B => S <= B;
			when ALU_SUB => S <= A + not B;
			when ALU_ADD => S <= A + B;
			when ALU_B_INC => S <= B + 1;
			when ALU_AND => S <= A and B;
			when ALU_OR => S <= A or B;
			when ALU_XOR => S <= A xor B;
			when others => S <= A + B ;
		end case;
		end process;


end arch_UAL;

