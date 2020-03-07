----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:32:14 01/21/2020 
-- Design Name: 
-- Module Name:    PC - arch_PC 
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

entity PC is
    Port ( clk : in  STD_LOGIC;
           raz : in  STD_LOGIC;
           load : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (11 downto 0);
           data_out : out  STD_LOGIC_VECTOR (11 downto 0));
end PC;

architecture arch_PC of PC is


begin

	process(clk,load,raz)
	begin
	if rising_edge(clk) then 
		if raz='1' then data_out <= (others => '0');
		elsif load='1' then data_out <= data_in;
		end if ;
		end if;
	end process;
 


end arch_PC;

