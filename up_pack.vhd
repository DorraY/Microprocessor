--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package up_pack is

type ALU_FACTS is (ALU_B, ALU_B_INC, ALU_ADD, ALU_SUB, ALU_AND, ALU_OR, ALU_XOR);
type OPCODE is ( OP_LDA,		
			 OP_STO,
			 OP_ADD,
			 OP_SUB,
			 OP_JMP,
			 OP_JGE,
			 OP_JNE,		
			 OP_STP,
			 OP_AND,
			 OP_OR,	
			 OP_XOR,
			 OP_LDR,
			 OP_LDI,		
			 OP_STI,
			 OP_JSR,
			 OP_RET,
			 OP_UNKNOWN );
end up_pack;

package body up_pack is


 
end up_pack;
