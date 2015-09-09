`timescale 1ns / 1ps


module testbench_toptop;

	// Inputs
	reg clk;
	reg rst;
	reg ps2d;
	reg ps2c;
	
	reg[7:0] datos[0:53];
	reg[10:0] aux;
	
	// Outputs
	wire [7:0] seg;
	wire [3:0] an;
	wire led;
	wire n;
	wire rt;

	// Instantiate the Unit Under Test (UUT)
	TOPTOP_PROY2 uut (
		.clk(clk), 
		.rst(rst), 
		.ps2d(ps2d), 
		.ps2c(ps2c), 
		.seg(seg), 
		.an(an), 
		.led(led), 
		.n(n), 
		.rt(rt)
	);
	
	integer i,j,x,y,z;
	
	initial //inicialización de las entradas:
		begin
			clk = 0;
			rst = 1;
			ps2d = 0;
			ps2c = 0;
			#100 rst = 0;
		end
	
	initial 
		begin
			$readmemh("cod_hexa.txt",datos);
			x = $fopen("resp_seg.txt");
			y = $fopen("resp_an.txt","w");
			z = $fopen("resp_led.txt","w");
			for(j=0;j<53;j=j+1)
				begin
					aux = {1'b1,1'b0,datos[j],1'b0};
					for(i=0;i<11;i=i+1)
						begin	
							@(negedge ps2c);
							ps2d = aux[i];
							$fdisplayb(x,seg);
							$fdisplayb(y,an);
							$fdisplayb(z,led);
						end
				end
			$fclose(x);
			$fclose(y);
			$fclose(z);
			$stop;
		end
					  
initial forever #5 clk = ~clk;
initial forever #50000 ps2c = ~ps2c;	
      
endmodule
