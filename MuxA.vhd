----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:01:51 01/21/2020 
-- Design Name: 
-- Module Name:    MuxA - arch_mux_A 
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

entity MuxA is
    Port ( sel : in  STD_LOGIC;
           e_0 : in  STD_LOGIC_VECTOR (11 downto 0);
           e_1 : in  STD_LOGIC_VECTOR (11 downto 0);
           s : out  STD_LOGIC_VECTOR (11 downto 0));
end MuxA;

architecture arch_mux_A of MuxA is

begin

	s <= e_0 when sel='0' else 
	     e_1;   
end arch_mux_A;

