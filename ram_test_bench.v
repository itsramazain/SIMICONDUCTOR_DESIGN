`timescale 1ns / 1ps
module test();
	reg CLOCK_50;
	reg [31:0] adress,data_in;
	reg Readmem,Writemem;
	wire  [31:0]data_out;
	ram rr(adress,data_in,data_out ,Readmem,Writemem);
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
	Readmem=1;
	adress=0;
	end
	
	

	
	
	
	initial
	begin
	#2;Readmem=0;Writemem=1;data_in=1;
	#2;Readmem=1;Writemem=0;data_in=1;
	#2;Readmem=0;Writemem=1;data_in=2;
	#2;Readmem=0;Writemem=1;data_in=4;
	#2;Readmem=1;Writemem=0;data_in=3;
	

	

		

	
	
	
	
	
	
	
	
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
