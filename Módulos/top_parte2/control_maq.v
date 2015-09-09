`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:18:22 09/01/2015 
// Design Name: 
// Module Name:    control_maq 
//////////////////////////////////////////////////////////////////////////////////
module control_maq(
	input wire clk,
	input wire [7:0] tecla,
	output reg rPres, rT, EN,
	output reg [2:0] hx_tecla
    );

	localparam 	apag = 1'b0, 
					enc = 1'b1;
							
	reg est, est_sig;
	 
	 //----------------------------
	 always @(posedge clk)
			est <= est_sig;
	 //----------------------------
	 always @ *
	 begin
		est_sig = est;
		rPres = 1'b0;
		rT = 1'b0;
		EN = 1'b0;
		hx_tecla = 3'b0;
		case(est)
			apag:		
				begin
					EN = 1'b0;
					rPres = 1'b0;
					rT = 1'b0;
					hx_tecla = 3'b0;
					if(tecla == 8'h24)
						begin
							EN = 1'b1;
							est_sig = enc;
						end
					else
						est_sig = apag;
				end			
			enc:
				begin
					EN = 1'b1;
					case(tecla)
						8'h4D: 	begin hx_tecla = 3'd1; est_sig = enc; rT = 1'b0; rPres = 1'b1; end
						8'h3A:	begin hx_tecla = 3'd1; est_sig = enc; rT = 1'b0; rPres = 1'b1; end
						8'h1B:	begin hx_tecla = 3'd0; est_sig = enc; rT = 1'b0; rPres = 1'b1; end
						8'h45:	begin hx_tecla = 3'd0; est_sig = enc; rT = 1'b1; rPres = 1'b0; end
						8'h16:	begin hx_tecla = 3'd1; est_sig = enc; rT = 1'b1; rPres = 1'b0; end
						8'h1E:	begin hx_tecla = 3'd2; est_sig = enc; rT = 1'b1; rPres = 1'b0; end
						8'h26:	begin hx_tecla = 3'd3; est_sig = enc; rT = 1'b1; rPres = 1'b0; end
						8'h25:	begin hx_tecla = 3'd4; est_sig = enc; rT = 1'b1; rPres = 1'b0; end
						8'h2E:	begin hx_tecla = 3'd5; est_sig = enc; rT = 1'b1; rPres = 1'b0; end
						8'h36:	begin hx_tecla = 3'd6; est_sig = enc; rT = 1'b1; rPres = 1'b0; end
						8'h1C:	est_sig = apag;
						default:	est_sig = enc;
					endcase
				end
			default: est_sig = apag;
		endcase
	 end
endmodule
