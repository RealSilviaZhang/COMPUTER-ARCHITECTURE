--Copyright (C) 1991-2010 Altera Corporation
--Your use of Altera Corporation's design tools, logic functions 
--and other software and tools, and its AMPP partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Altera Program License 
--Subscription Agreement, Altera MegaCore Function License 
--Agreement, or other applicable license agreement, including, 
--without limitation, that your use is for the sole purpose of 
--programming logic devices manufactured by Altera and sold by 
--Altera or its authorized distributors.  Please refer to the 
--applicable agreement for further details.


FUNCTION ram2port_inst_data 
(
	address_a[10..0],
	address_b[10..0],
	byteena_b[3..0],
	clock_a,
	clock_b,
	data_a[31..0],
	data_b[31..0],
	enable_a,
	enable_b,
	wren_a,
	wren_b
)

RETURNS (
	q_a[31..0],
	q_b[31..0]
);
