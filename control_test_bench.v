













`timescale 1ns / 1ps
module test();
	reg CLOCK_50;
	reg Reset ;
	reg [5:0]opcode,funct;
	wire rt_or_rd;
	wire brancheq,branchnotequal;
	wire branchgreaterthan;
	wire branchlessthanorequal;
	wire branchgreaterthanorequal;
	wire jr;
	wire jal;
	wire branchlessthan;
	reg Run;
	wire pc_write,Regwrite,Aluscr,MemWrite,MemRead,regRead,MemtoReg,jump;
	wire [3:0]ALUOP;
	control c0(CLOCK_50,Reset,opcode,Run,pc_write,funct,Regwrite,Aluscr,MemWrite,MemRead,regRead,MemtoReg,ALUOP,jump,rt_or_rd,brancheq,branchnotequal,branchgreaterthan,branchlessthanorequal,branchgreaterthanorequal,jr,jal,branchlessthan);
	 
	
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
	Reset=0;
	Run=1;
	#0.5;
	
	
	end
	
	

	
	
	
	initial
	begin
	/* instruction   __ opcode __ function filed 
		/1add        __000000__  10 0000    //implemented  
		/2sub        ___000000__    10 0010  //implemented
		/3and       ___000000 ___   10 0100  //implemented
		/4andi       __  00 1100___no function filed  //implemented
		/5or         ____000000___  10  0101     //implemented
		/6ori     ____00 1101__no function filed   //implemented
		/7nor       ___000000 ___ 10 0111     //implemented
		/8sll   	___000000__00000   //implemented
		/9srl  		_____ 00000  ____00 0010   //implemented
		/10addi		 ____00 1000 ____no functionfield   //implemented
		/11addu    ______ 00 1001 _______100001   // not implemented
		/12subu   ____ 00 0000 ____ 100011  //not  implemented
		/13xor      ____ 000000____10 0110  //implemented
		/14beq     _____000100 _____ no function field  //implemented
		/15bnq       ____000101 _____ no function field  //implemented
		/16jump   _____  000010 _____no function field  //implemented
		17jr     ____ 000000   _____001001   //  not implemented
		18jal    _____ 000011 ______no function field  // not implemented
		/19lw    ______   100011 ______no function field //  //implemented
		/20sw    ______  101011 ______no function field  //implemented
		/21slt ____ 000000_____101010  //implemented
		

*/

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
	#2;opcode=6'b000000;funct=6'b100000 ;//add
	#2;opcode=6'b000000;funct=6'b100010 ;//sub
	#2;opcode=6'b000000;funct=6'b100100 ;//and
	#2;opcode=6'b000000;funct=6'b100101  ;//or
	#2;opcode=6'b000000;funct=6'b001001  ;//jr
	#2;opcode=6'b000000;funct=6'b100111  ;//nor
	#2;opcode=6'b000000;funct=6'b000000  ;//sll
	#2;opcode=6'b000000;funct=6'b000010  ;//srl
	#2;opcode=6'b000000;funct=6'b100011  ;//subu
	#2;opcode=6'b000000;funct=6'b100001  ;//addu
	#2;opcode=6'b000000;funct=6'b100111  ;//nor
	#2;opcode=6'b000000;funct=6'b100110  ;//xor
	#2;opcode=6'b001100;funct=6'b100110  ;//andi
	#2;opcode=6'b001000;funct=6'b100110  ;//addi
	#2;opcode=6'b000100;funct=6'b100110  ;//beq
	#2;opcode=6'b000101;funct=6'b100110  ;//bnq
	#2;opcode=6'b001101;funct=6'b100110  ;//ori001101
	#2;opcode=6'b000010;funct=6'b100110  ;//jump
	#2;opcode=6'b100011;funct=6'b100110  ;//lw
	#2;opcode=6'b101011;funct=6'b100110  ;//sw
	#2;opcode=6'b000000;funct=6'b101010  ;//slt
	#2;opcode=6'b001111;funct=6'b000000  ;//BGT
	#2;opcode=6'b110000;funct=6'b000000  ;//BLT
	#2;opcode=6'b100101;funct=6'b000000  ;//BLE
	#2;opcode=6'b100101;funct=6'b000000  ;//BGT
	#2;opcode=6'b000011;funct=6'b000000  ;//jal
	

	
	
	
	
	
	
	
	
	

	

		

	
	
	
	
	
	
	
	
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














/*`timescale 1ns / 1ps
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
