----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:13:27 01/21/2020 
-- Design Name: 
-- Module Name:    tristate - arch_tristate 
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

entity tristate is
    Port ( oe : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           data_out : inout  STD_LOGIC_VECTOR (15 downto 0));
end tristate;

architecture arch_tristate of tristate is

begin

	data_out <= data_in when (oe = '1') else (others => 'Z');

end arch_tristate;

