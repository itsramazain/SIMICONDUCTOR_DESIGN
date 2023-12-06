








`timescale 1ns / 1ps
module test();
	reg CLOCK_50;
	reg Reset,Run;
	
	wire [31:0]pc_out0,instruction0,pcp4orjump0,pcp4orjumporbranchorjal0;
	wire pc_write0,jump0,Regwrite0,Aluscr0,MemWrite0,MemRead0,MemtoReg0,regRead0,zero0;
	wire [3:0]ALUOP0;
	wire [31:0]pcp40,BT0;
	wire [15:0]imm0;
	wire [31:0]rs_data0,rt_data0,mux1_out0,mux3_out0,mux4_out0,mux5_out0,alu_out0,mem_out_data0,seimm0;
	wire [5:0]opcode0,funct0;
	wire [4:0]rs_addr0,rt_addr0,rd_addr0,shamt0;
	wire [25:0]adderss0;
	wire brancheq0,branchnotequal0,branchgreaterthan0,branchlessthanorequal0,branchgreaterthanorequal0,jr0,jal0,branchlessthan0;
	wire [31:0]mux13_out0,pcp4orjumporbranchorjalorjr0;
	wire [31:0]r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31;
	
	wire [31:0]mux12_out0;
	
	parameter CLOCK_PERIOD=2;
	
	process proc(CLOCK_50,Reset,Run,pc_write0,jump0,Regwrite0,Aluscr0,MemWrite0,MemRead0,MemtoReg0,regRead0,ALUOP0,pc_out0,instruction0,pcp40,BT0,imm0,seimm0,rs_data0,rt_data0,mux1_out0,mux3_out0,mux4_out0,
mux5_out0,alu_out0,zero0,mem_out_data0,opcode0,funct0,rs_addr0,rt_addr0,rd_addr0,shamt0,adderss0,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31,brancheq0,branchnotequal0,branchgreaterthan0,branchlessthanorequal0,
branchgreaterthanorequal0,jr0,jal0,branchlessthan0,mux12_out0,mux13_out0,pcp4orjumporbranchorjalorjr0,pcp4orjump0,pcp4orjumporbranchorjal0);

	
	
	
	
	initial begin
			CLOCK_50 <= 1'b0;
		end // initial
		always @ (*)
		begin : Clock_Generator
			#((CLOCK_PERIOD) / 2) 
			CLOCK_50 <= ~CLOCK_50;
		end
	
	
	
	initial 
	begin
	Run=1;
	Reset=1;
	#0.005;Reset=0;
	end 


	
	

	
	
	
	initial
	begin
	

	

		

	
	
	
	
	
	
	
	
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

*/
