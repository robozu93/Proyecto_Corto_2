`timescale 1ns / 1ps

module code_kb(
	input wire clk, reset, ps2d, ps2c,
	output wire [7:0] dataout,
	output wire nada,
	output wire rx_tick
    );
	 
wire [7:0] dbus;
wire tick;

PS2 ps2rx(clk,reset,ps2d,ps2c,1'b1,tick,dbus,nada);
ps2_filtro filtro(clk,reset,tick,dbus,rx_tick,dataout);

endmodule
