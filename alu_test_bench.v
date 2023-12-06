`timescale 1ns / 1ps
module test();
	reg CLOCK_50;
	reg [3:0]ALU_OP;
	reg [4:0]shmt;
	reg [31:0]rs,rt;
	wire zero; 
	wire [31:0]alu_result;
	wire overflow,lessthan,carry;
	alu arth(ALU_OP,rs,rt,alu_result,zero,shmt,overflow,lessthan,carry);
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
	shmt<=5'd3;
	end
	
	

	
	
	
	initial
	begin
	

	/* 0000 and 
	0001 or 
	0010 add
	0011 sub
	0100 nor
	0101 xor
	0110 slt
	0111 sll
	1000 srl
	1001 subu
	1011 addu
	*/

		
	#2;ALU_OP=4'b000;
	#2;ALU_OP=4'b001;
	#2;ALU_OP=4'b010;
	#2;ALU_OP=4'b011;
	#2;ALU_OP=4'b100;
	#2;ALU_OP=4'b101;
	#2;ALU_OP=4'b110;
	#2;ALU_OP=4'b111;
	#2;ALU_OP=4'b1000;
	#2;ALU_OP=4'b1001;
	#2;ALU_OP=4'b1011;
	
	
	
	
	
	
	
	
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
