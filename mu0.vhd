----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:06:38 01/22/2020 
-- Design Name: 
-- Module Name:    mu0 - arch_mu0 
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
use work.up_pack.all;
use work.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mu0 is
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           data_bus : inout  STD_LOGIC_VECTOR (15 downto 0);
           addr_bus : inout  STD_LOGIC_VECTOR (11 downto 0);
           mem_rq : out  STD_LOGIC;
           rnw : out  STD_LOGIC);
end mu0;

architecture arch_mu0 of mu0 is

	component Acc is 
	port(clk, raz, load : in std_logic;
	data_in, data_out : out std_logic (15 downto0);
	acc15, accz : out std_logic);
	end component;
	
	component MuxA is
	port (sel : in std_logic; e_0,e_1: in std_logic_vector(11 downto 0);
	s : out std_logic_vector(11 downto 0));
	end component;
	
	component MuxB is 
	port (sel : in std_logic; e_0, e_1 : in std_logic_vector(15 downto 0);
	s : out std_logic_vector(15 downto 0));
	end component;
	
	component PC is 
	port ( clk, raz, load : in std_logic;
	data_in : in std_logic_vector(11 downto 0);
	data_out : out std_logic_vector(11 downto));
	end component;
	
	component RI is 
	port (clk, raz,load : in std_logic;
	data_in: in std_logic_vector(15 downto 0);
	data_out: out std_logic_vector(11 downto 0);
	opcode: out OPCODE);
	end component;
	
	component tristate	is 
	port ( oe : in std_logic
	
	

	signal opcode : OPCODE;
	signal raz : std_logic;
	signal ir_out : std_logic_vector(11 downto 0);
	signal pc_out : std_logic_vector(11 downto 0);
	signal alu_out : std_logic_vector(15 downto 0);
	signal acc_out : std_logic_vector(15 downto 0);
	signal muxb_out : std_logic_vector(15 downto 0);
	signal concat : std_logic_vector(15 downto 0);
	signal alufs : ALU_FACTS;
	signal ir_ld : std_logic;
	signal pc_ld : std_logic;
	signal acc_ld : std_logic;
	signal acc_oe : std_logic;
	signal selA : std_logic;
	signal selB : std_logic;
	signal accZ : std_logic;
	signal acc15 : std_logic;

begin


end arch_mu0;

