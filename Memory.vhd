----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:36:16 01/22/2020 
-- Design Name: 
-- Module Name:    Memory - arch_memory 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Memory is
    Port ( addr_bus : in  STD_LOGIC_VECTOR (11 downto 0);
           RNW : in  STD_LOGIC;
           MEMrq : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           data_bus : inout  STD_LOGIC_VECTOR (15 downto 0));
end Memory;

architecture arch_memory of Memory is

type memory_type is array (integer range 0 to 15) of std_logic_vector(15 downto 0);

signal memory : memory_type := 
(                     -- ADRESSE -- DONNEE
  "0000000000000100", --    0    -- LDA 0x4
  "0010000000000100", --    1    -- ADD 0x4
  "0001000000000101", --    2    -- STO 0x5 
  "0111000000000000", --    3    -- STP
  "0000000000000111", --    4    -- donnée=7
  "0000000000000000", --    5    -- 
  "0000000000000000", --    6    -- 
  "0000000000000000",  --   7    -- 
  "0000000000000000",  --   8    -- 
  "0000000000000000",  --   9    -- 
  "0000000000000000",  --   10   -- 
  "0000000000000000",  --   11   -- 
  "0000000000000000",  --   12   -- 
  "0000000000000000",  --   13   -- 
  "0000000000000000",  --   14   -- 
  "0000000000000000"   --   15   -- 
);

begin

	data_bus <= memory(to_integer(unsigned(data_bus)))  when (MEMrq = '1' and RNW  = '1') else (others => 'Z');

	process (clk)
	begin
		if rising_edge(clk) then 
		      if (MEMrq = '1') and (RNW = '0') then
			     memory(to_integer(unsigned(addr_bus))) <= data_bus;
		      end if;
		end if;      
	end process;
	
	
	end arch_memory;

