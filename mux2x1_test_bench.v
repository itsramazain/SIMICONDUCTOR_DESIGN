`timescale 1ns / 1ps
module test();
	reg CLOCK_50;
	reg [31:0]i0,i1;
	reg sel;
	wire [31:0]out;
	mux_2x1 m(i0,i1,sel,out);
	parameter CLOCK_PERIOD=2;
	
	
	
	initial begin
			CLOCK_50 <= 1'b1;
		end // initial
		always @ (*)
		begin : Clock_Generator
			#((CLOCK_PERIOD) / 2) 
			CLOCK_50 <= ~CLOCK_50;
		end
	
	
	initial
	begin
	i0=100;
	i1=2;
	end
	
	

	
	
	
	initial
	begin
	#2;sel=1;
	#2;sel=0;
	#2;
	#2;

	

		

	
	
	
	
	
	
	
	
	end
	
	
	
	initial
	begin
	#1000 $stop;
	end
	initial
  begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
	
	

endmodule
