----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:21:01 01/21/2020 
-- Design Name: 
-- Module Name:    Acc - arch_acc 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Acc is
    Port ( clk : in  STD_LOGIC;
           raz : in  STD_LOGIC;
           load : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           data_out : out  STD_LOGIC_VECTOR (15 downto 0);
           acc15 : out  STD_LOGIC;
           accz : out  STD_LOGIC);
end Acc;

architecture arch_acc of Acc is

signal q_reg : std_logic_vector(15 downto 0);


begin

   process(clk)
	begin 
	if rising_edge(clk) then 
		if raz='1' then q_reg <= (others => '0');
		elsif load='1' then q_reg <= data_in;
		end if ;
		acc15 <= q_reg(15);
		if q_reg=(15 downto 0 => '0') then accz<='1';
		else accz<='0';
		end if;
		data_out <= q_reg;
	end if;
   end process;


end arch_acc;

