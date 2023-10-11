`timescale 1ns / 1ps
module test();
	reg CLOCK_50;
	reg Reset ;
	reg [5:0]opcode,funct;
	
	reg Run;
	wire pc_write,Regwrite,Aluscr,Pcsrc,branch,MemWrite,MemRead,regRead,MemtoReg,jump;
	wire [3:0]ALUOP;
	control c0(CLOCK_50,Reset,opcode,Run,pc_write,funct,Regwrite,Aluscr,Pcsrc,branch,MemWrite,MemRead,regRead,MemtoReg,ALUOP,jump);
	
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
