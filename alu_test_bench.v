`timescale 1ns / 1ps
module test();
	reg CLOCK_50;
	reg [2:0]ALU_OP;
	reg [31:0]rs,rt;
	wire zero; 
	wire [31:0]alu_result;
	alu arth(ALU_OP,rs,rt,alu_result,zero);
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
	rs<=32'b111;	
	rt<=32'b101;
	end
	
	

	
	
	
	initial
	begin
	

	

		
	#2;ALU_OP=3'b000;
	#2;ALU_OP=3'b001;
	#2;ALU_OP=3'b010;
	#2;ALU_OP=3'b011;
	#2;ALU_OP=3'b100;
	#2;ALU_OP=3'b101;
	#2;ALU_OP=3'b110;
	
	
	
	
	
	
	
	
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
