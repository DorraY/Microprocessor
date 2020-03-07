----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:49:30 01/21/2020 
-- Design Name: 
-- Module Name:    sequenceur - arch_sequenceur 
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sequenceur is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           accz : in  STD_LOGIC;
           acc15 : in  STD_LOGIC;
			  opcode : in OPCODE;
           raz : out  STD_LOGIC;
           selA : out  STD_LOGIC;
           selB : out  STD_LOGIC;
           acc_ld : out  STD_LOGIC;
           pc_ld : out  STD_LOGIC;
           ir_ld : out  STD_LOGIC;
           acc_oe : out  STD_LOGIC;
			  alufs : out ALU_FACTS ;
           memrq : out  STD_LOGIC;
           renw : out  STD_LOGIC);
end sequenceur;

architecture arch_sequenceur of sequenceur is

  type me_states is (INIT, FETCH, EXECUTE, STOP);
  signal  etat_cr, etat_sv : me_states  ;

begin

process( clk , reset)
    begin
      if reset='1' then etat_cr <= INIT;
      elsif rising_edge(clk) then etat_cr <= etat_sv; 
      end if;     
end process;   
      
process(etat_cr, opcode, accz, acc15)
    begin
etat_sv <= etat_cr; raz <= '0'; selA <= '0'; selB <= '0'; 
acc_ld <= '0'; acc_oe <= '0';
pc_ld <= '0'; ir_ld <= '0'; 
alufs <= ALU_B_INC;
memrq <= '1';
renw <='1';
         
        case etat_cr is
            when INIT =>
                etat_sv <= FETCH;
                raz <= '1';
            when FETCH =>
                etat_sv <= EXECUTE;
                ir_ld <= '1';                -- load IR with data on the data bus
                alufs <= ALU_B_INC;          -- op = B+1
                pc_ld <= '1';                -- load PC with PC+1
            when EXECUTE =>
                case opcode is
                    when OP_LDA =>            
                        selA <= '1';         -- IR[mem] on addr bus
                        selB <= '1';                     
                        alufs <= ALU_B;      -- op = B
                        acc_ld <= '1';       -- load data in accumulator
                        etat_sv <= FETCH;
                    when OP_STO =>           
                        selA <= '1';     -- IR[mem] on addr bus
                        acc_oe <= '1';       -- output accumulator on data bus
                        renw <= '0';          -- select write to memory
                        etat_sv <= FETCH;
                    when OP_ADD =>           
                        selA <= '1';     -- IR[mem] on addr bus
                        selB <= '1';     -- data to B alu entry
                        alufs <= ALU_ADD;    -- op = A+B
                        acc_ld <= '1';       -- load result in accumulator
                        etat_sv <= FETCH;
                    when OP_SUB =>           
                        selA <= '1';     -- IR[mem] on addr bus
                        selB <= '1';     -- data to B alu entry
                        alufs <= ALU_SUB;    -- op = A-B
                        acc_ld <= '1';       -- load result in accumulator
                        etat_sv <= FETCH;
                    when OP_JMP =>           
                        selA <= '1';     -- IR[mem] on addr bus
                        alufs <= ALU_B;      -- op = B
                        pc_ld <= '1';        -- load PC with IR[mem]
                        etat_sv <= FETCH;
                    when OP_JGE =>           
                        if acc15='0' then   -- jump, else nothing
                            selA <= '1';     -- IR[mem] on addr bus
                            alufs <= ALU_B;      -- op = B
                            pc_ld <= '1';        -- load PC with IR[mem]
                        end if;
                        etat_sv <= FETCH;
                    when OP_JNE =>           
                        if accz='0' then    -- jump, else nothing
                            selA <= '1';     -- IR[mem] on addr bus
                            alufs <= ALU_B;      -- op = B
                            pc_ld <= '1';        -- load PC with IR[mem]
                        end if;
                        etat_sv <= FETCH;
                    when OP_STP =>   
                        etat_sv <= STOP;
                    when OP_AND =>           
                        selA <= '1';     -- IR[mem] on addr bus
                        selB <= '1';     -- data to B alu entry
                        alufs <= ALU_AND;    -- op = A and B
                        acc_ld <= '1';       -- load result in accumulator
                        etat_sv <= FETCH;
                    when OP_OR =>            
                        selA <= '1';     -- IR[mem] on addr bus
                        selB <= '1';     -- data to B alu entry
                        alufs <= ALU_OR; -- op = A or B
                        acc_ld <= '1';       -- load result in accumulator
                        etat_sv <= FETCH;
                    when OP_XOR =>           
                        selA <= '1';     -- IR[mem] on addr bus
                        selB <= '1';     -- data to B alu entry
                        alufs <= ALU_XOR;    -- op = A xor B
                        acc_ld <= '1';      -- load result in accumulator
                        etat_sv <= FETCH;
                                     
                    when others =>
                        etat_sv <= STOP;
                end case;
                 
            when STOP => etat_sv <= STOP;
        end case;     
  
end process;
 
end arch_sequenceur;

