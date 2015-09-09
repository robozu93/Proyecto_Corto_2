`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Module Name:    ps2_filtro1 
//////////////////////////////////////////////////////////////////////////////////

module ps2_filtro(
	input wire clk,
	input wire reset,
	input wire tick,
	input wire [7:0] datain,
	output wire rx_tick,
	//output wire nada2,
	output wire [7:0] dataout
    );
	 
reg[1:0] state_reg, state_next;
reg n_tick;
reg [6:0] dtemp_reg, dtemp_next;

localparam
	idle = 2'b00,
	read = 2'b01,
	load = 2'b10;
	
initial
	begin
		dtemp_reg = 0;
		dtemp_next = 0;
	end

always@(posedge clk, posedge reset)
	begin
		if(reset)
			begin
				state_reg <= idle;
				dtemp_reg <= 0;
			end
		else
			begin
				state_reg <= state_next;
				dtemp_reg <= dtemp_next;
			end
	end

always @*
	begin
		state_next = state_reg;
		dtemp_next = dtemp_reg;
		n_tick = 0;
		case(state_reg)
			idle:
				begin
					if(tick & datain ==8'hF0)
						state_next = read;
				end
			read:
				if(tick)
					begin
						case(datain)
							8'h1C: state_next = load;
							8'h24: state_next = load;
							8'h4D: state_next = load;
							8'h3A: state_next = load;
							8'h1B: state_next = load;
							8'h16: state_next = load;
							8'h1E: state_next = load;
							8'h26: state_next = load;
							8'h25: state_next = load;
							8'h2E: state_next = load;
							8'h36: state_next = load;
							8'h45: state_next = load;
							8'hF0: state_next = read;
							default: state_next = idle;
						endcase
					end
			load:
				begin
					dtemp_next = datain[6:0];
					state_next = idle;
					n_tick = 1'b1;
				end
		endcase
	end
	
	assign rx_tick = n_tick;
	assign dataout = {1'b0,dtemp_reg};
	//assign nada2 = dtemp_reg[7];

endmodule
