`timescale 1ns / 1ps
module test();
	reg CLOCK_50;
	reg left;
	reg [31:0] regis;
	wire [31:0] out;
	reg [4:0]samt;
	shiftlogic sll(left,regis,samt,out);
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
	regis=5;
	end
	
	

	
	
	
	initial
	begin
	#2;left=1;samt=1;
	#2;left=0;samt=1;
	#2;left=1;samt=4;
	#2;left=0;samt=4;

	

		

	
	
	
	
	
	
	
	
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
