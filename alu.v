///i have an idea to improve it to gate level will work on it in the innovation stage !
//

/* 000 and 
	001 or 
	010 add
	011 sub
	100 nor
	101 xor
	110 slt
*/
module alu(ALU_OP,rs,rt,alu_result,zero);

	input [2:0]ALU_OP;
	input [31:0]rs,rt;
	output reg[31:0]alu_result;
	output      zero ;
	
	
	assign zero=~alu_result;
	
	always@(*)
	
	case(ALU_OP)
	 3'b000:alu_result=rs && rt;
	 3'b001 : alu_result=rs | rt;
	 3'b010 :alu_result=rs+rt;
	 3'b011 :alu_result=rs-rt;
	 3'b100 :alu_result=~(rs | rt);
	 3'b101 :alu_result=(rs ^ rt);
	 3'b110:alu_result=(rs<rt)?1:0;
	
	
	
	
	

	
	endcase
	

endmodule
