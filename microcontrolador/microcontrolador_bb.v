
module microcontrolador (
	clk_clk,
	pinos_saida_div_external_connection_export,
	pinos_saida_max_external_connection_export,
	pinos_saidad_external_connection_export,
	reset_reset_n);	

	input		clk_clk;
	output	[15:0]	pinos_saida_div_external_connection_export;
	output	[15:0]	pinos_saida_max_external_connection_export;
	output	[15:0]	pinos_saidad_external_connection_export;
	input		reset_reset_n;
endmodule
