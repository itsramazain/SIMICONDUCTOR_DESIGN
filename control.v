////this whole file will change in the pipeline stage
///i should modify the design to take in the rest signal  
/// instruction subset thier hex opcode/function filed
///we will have to modify the alu so it can take the unsign operation
//some of the instructions like  subu (the unsign operstions ) ... jal,jr....... will not be implememented in the first month

	/* instruction   __ opcode __ function filed 
		/add        __000000__  10 0000    //implemented  
		/sub        ___000000__    10 0010  //implemented
		/and       ___000000 ___   10 0100  //implemented
		/andi       __  00 1100___no function filed  //implemented
		/or         ____000000___  10  0101     //implemented
		/ori     ____00 1101__no function filed   //implemented
		/nor       ___000000 ___ 10 0111     //implemented
		/sll   	___000000__00000   //implemented
		/srl  		_____ 00000  ____00 0010   //implemented
		/addi		 ____00 1000 ____no functionfield   //implemented
		/addu    ______ 00 1001 _______100001   // not implemented
		/subu   ____ 00 0000 ____ 100011  //not  implemented
		/xor      ____ 000000____10 0110  //implemented
		/beq     _____000100 _____ no function field  //implemented
		/bnq       ____000101 _____ no function field  //implemented
		/jump   _____  000010 _____no function field  //implemented
		jr     ____ 000000   _____001001   //  not implemented
		jal    _____ 000011 ______no function field  // not implemented
		/lw    ______   100011 ______no function field //  //implemented
		/sw    ______  101011 ______no function field  //implemented
		/slt ____ 000000_____101010  //implemented
		

*/

module control(clock,Reset,opcode,Run,pc_write,funct,Regwrite,Aluscr,Pcsrc,branch,MemWrite,MemRead,regRead,MemtoReg,ALUOP,jump);
	input clock,Reset,Run;
	output  reg pc_write,jump,Regwrite,Aluscr,Pcsrc,MemWrite,MemRead,MemtoReg,regRead,branch;
	output  reg [3:0]ALUOP;
	
	
	
	
	always @(posedge clock)
	if (Run)
		pc_write=1;	
	else 
		pc_write =0;
		
		
	
	
	input [5:0]opcode;

	input [5:0]funct;
	
	
	
	/*assign opcode=Instruction[31:26];
	assign rs_addr=Instruction[25:21];
	assign rt_addr=Instruction[20:16];
	assign rd_addr=Instruction[15:11];
	assign shamt=Instruction[10:6];
	assign funct=Instruction[5:0];
	assign imm=Instruction[15:0];
	assign adderss=Instruction[25:0];*/
	
	
	always @(posedge clock)
	begin
					
					if (Run)
										begin
														if (opcode===6'b0)
														//this means its R type
														begin
																regRead=1;
																Regwrite=1;
																Aluscr=0;
																Pcsrc=0;
																MemWrite=0;
																MemRead=0;
																MemtoReg=1;
																branch=1'bx;
																jump=1'b0;
																case(funct)
																				6'b100000://add
																				begin
																					ALUOP=4'b0010;
																				
																				end 
																				
																				6'b100010://sub
																				begin
																					ALUOP=4'b0011;

																				end

																					
																				
																				
																				
																				6'b100100://and
																				begin
																					ALUOP=4'b0000;
																				end 
																				
																				6'b100101  ://or
																				begin
																					ALUOP=4'b0001;
																				end
																				
																				6'b100111 ://nor
																				begin
																					ALUOP=4'b0100;
																				end
																				
																				6'b000000 ://sll
																				begin
																					ALUOP=4'b0111;
																				
																				
																				
																				
																				end 
																				
																				
																				6'b000010 ://srl
																				begin
																					ALUOP=4'b1000;
																				end 
																				
																				
																				6'b100110 ://xor
																				begin
																					ALUOP=4'b0101;
																				end 
																				
																				
																				
																				
																				
																				
																				6'b101010 ://slt
																				begin
																					ALUOP=4'b0110;
																				end
																				
																				6'b100011 ://subu
																				begin
																					ALUOP=4'b1001;
																				end
																				
																				6'b100001 ://addu
																				begin
																					ALUOP=4'b1011;
																				end

																	
																endcase
														end
														else if (opcode===6'b001100)//andi
														begin 
																jump=1'b0;
																regRead=1;
																Regwrite=1;
																Aluscr=1;
																branch=1'bx;
																Pcsrc=0;
																ALUOP=4'b0000;
																MemWrite=0;
																MemRead=0;
																MemtoReg=1;
														end 
														
														else if (opcode===6'b001101  )//ori
														begin 
																jump=1'b0;
																regRead=1;
																Regwrite=1;
																Aluscr=1;
																branch=1'bx;
																Pcsrc=0;
																ALUOP=4'b0001;
																MemWrite=0;
																MemRead=0;
																MemtoReg=1;
														end
														
														
														
														
														
														else if (opcode===6'b001000)//addi
														begin 
																regRead=1;
																jump=1'b0;
																Regwrite=1;
																Aluscr=1;
																branch=1'bx;
																Pcsrc=0;
																ALUOP=4'b0010;
																MemWrite=0;
																MemRead=0;
																MemtoReg=1;
														end
														
														else if (opcode===6'b100011)//lw
														begin 
																regRead=1;
																Regwrite=1;
																jump=1'b0;
																Aluscr=1;
																Pcsrc=0;
																branch=1'bx;
																ALUOP=4'b0010;
																MemWrite=0;
																MemRead=1;
																MemtoReg=0;
														end
														
														else if (opcode===6'b101011)//sw
														begin 
																regRead=1;
																jump=1'b0;
																Regwrite=0;
																Aluscr=1;
																Pcsrc=0;
																branch=1'bx;
																ALUOP=4'b0010;
																MemWrite=1;
																MemRead=0;
																MemtoReg=1'bx;
														end
														
														
														
														else if (opcode===6'b000100)//beq
														begin 
																regRead=1;
																Regwrite=0;
																Aluscr=1;
																Pcsrc=1;
																jump=1'b0;
																ALUOP=4'b0011;
																MemWrite=0;
																MemRead=0;
																branch=1;
																MemtoReg=1'bx;
														end
														
														
														else if (opcode===6'b000101)//bnq
														begin 
																regRead=1;
																Regwrite=0;
																Aluscr=1;
																Pcsrc=1;
																ALUOP=4'b0011;
																MemWrite=0;
																MemRead=0;
																branch=0;
																jump=1'b0;
																MemtoReg=1'bx;
														end
														
														
														else if (opcode===6'b000010)//jump
														begin 
																regRead=1;
																Regwrite=0;
																Aluscr=1;
																Pcsrc=1;
																ALUOP=4'bxxxx;
																MemWrite=0;
																MemRead=0;
																branch=0;
																jump=1'b1;
																MemtoReg=1'bx;
														end
										 
										
										
					end
					
					
					
					
					
					else
					begin 
							regRead=0;
							Regwrite=0;
							Aluscr=1'bx;
							Pcsrc=1'bx;
							ALUOP=4'bxxxx;
							MemWrite=0;
							MemRead=0;
							branch=0;
							jump=1'b0;
							MemtoReg=1'bx;	
					
					end 
	end

	

endmodule
