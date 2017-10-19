-- entity name: g06_pop_enable
--
-- Copyright (C) 2017 Abbas Yadollahi - He Qian Wang
-- Version 1.0
-- Author: Abbas Yadollahi (abbas.yadollahi@mail.mcgill.ca)
--         He Qian Wang (he.q.wang@mail.mcgill.ca)
-- Date: Oct/18/2017

library lpm;
library ieee;
use lpm.lpm_components.all;
use ieee.std_logic_1164.all;

entity g06_pop_enable is
	port(
		clk	: std_logic;
		N		: in std_logic_vector(5 downto 0);
		P_EN	: out std_logic_vector(51 downto 0)
	);
end g06_pop_enable;

architecture lookup of g06_pop_enable is
	--signal x				: std_logic_vector(5 downto 0);
	--signal crc_of_x	: std_logic_vector(51 downto 0);

	begin

	lookup_table : lpm_rom	-- Use the altera rom library macrocell
	generic map(
		lpm_width => 52,			-- The width of the word stored in each ROM location
		lpm_widthad => 6,			-- Sets the width of the ROM address bus
		lpm_numwords => 64,		-- Sets the number of words stored in the ROM
		lpm_outdata => "UNREGISTERED",			-- No register on the output
		lpm_address_control => "REGISTERED",	-- Register on the input
		lpm_file => "g06_popup_rom_data.mif"	-- The ascii file containing the ROM data
	)

	port map(
		inclock => clk,
		address => N,
		q => P_EN
	);

end lookup;
