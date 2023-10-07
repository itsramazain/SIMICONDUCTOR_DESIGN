///in pipelined mips the regfile should read from the regesters then wirte on the in the negative edge of the cycle 

module register_file(clock,Reset,a_addr,b_addr,d_addr,read_sig,write_sig,writeback_data,a_data,b_data,r0_out_o,r1_out_o,r2_out_o,rin_o);
	input [4:0]a_addr,b_addr,d_addr;
	input [31:0]writeback_data ;
	output rin_o;
	
	input read_sig,write_sig,Reset,clock;
	output [31:0]a_data,b_data;
	wire [31:0]rin;
	assign rin_o=rin;
	wire [31:0] r0_out,r1_out,r2_out,r3_out,r4_out,r5_out,r6_out,r7_out,r8_out,r9_out,r10_out,r11_out,r12_out,r13_out,r14_out,r15_out,r16_out,r17_out,r18_out,r19_out,r20_out,r21_out,r22_out,r23_out,r24_out,r25_out,r26_out,r27_out,r28_out,r29_out,r30_out,r31_out;
	output [31:0]r0_out_o,r1_out_o,r2_out_o;
	assign r0_out_o=r0_out;
	assign r1_out_o=r1_out;
	assign r2_out_o=r2_out;
	
	
	
	dec dee(write_sig, d_addr, rin);
	register r0(32'b0,clock,1,r0_out,rin[31]);
	register r1(writeback_data,clock,Reset,r1_out,rin[30]);
	register r2(writeback_data,clock,Reset,r2_out,rin[29]);
	register r3(writeback_data,clock,Reset,r3_out,rin[28]);
	register r4(writeback_data,clock,Reset,r4_out,rin[27]);
	register r5(writeback_data,clock,Reset,r5_out,rin[26]);
	register r6(writeback_data,clock,Reset,r6_out,rin[25]);
	register r7(writeback_data,clock,Reset,r7_out,rin[24]);
	register r8(writeback_data,clock,Reset,r8_out,rin[23]);
	register r9(writeback_data,clock,Reset,r9_out,rin[22]);
	register r10(writeback_data,clock,Reset,r10_out,rin[21]);
	register r11(writeback_data,clock,Reset,r11_out,rin[20]);
	register r12(writeback_data,clock,Reset,r12_out,rin[19]);
	register r13(writeback_data,clock,Reset,r13_out,rin[18]);
	register r14(writeback_data,clock,Reset,r14_out,rin[17]);
	register r15(writeback_data,clock,Reset,r15_out,rin[16]);
	register r16(writeback_data,clock,Reset,r16_out,rin[15]);
	register r17(writeback_data,clock,Reset,r17_out,rin[14]);
	register r18(writeback_data,clock,Reset,r18_out,rin[13]);
	register r19(writeback_data,clock,Reset,r19_out,rin[12]);
	register r20(writeback_data,clock,Reset,r20_out,rin[11]);
	register r21(writeback_data,clock,Reset,r21_out,rin[10]);
	register r22(writeback_data,clock,Reset,r22_out,rin[9]);
	register r23(writeback_data,clock,Reset,r23_out,rin[8]);
	register r24(writeback_data,clock,Reset,r24_out,rin[7]);
	register r25(writeback_data,clock,Reset,r25_out,rin[6]);
	register r26(writeback_data,clock,Reset,r26_out,rin[5]);
	register r27(writeback_data,clock,Reset,r27_out,rin[4]);
	register r28(writeback_data,clock,Reset,r28_out,rin[3]);
	register r29(writeback_data,clock,Reset,r29_out,rin[2]);
	register r30(writeback_data,clock,Reset,r30_out,rin[1]);
	register r31(writeback_data,clock,Reset,r31_out,rin[0]);
	
	
	
	
	d d1(read_sig,a_addr,r0_out,r1_out,r2_out,r3_out,r4_out,r5_out,r6_out,r7_out,r8_out,r9_out,r10_out,r11_out,r12_out,r13_out,r14_out,r15_out,r16_out,r17_out,r18_out,r19_out,r20_out,r21_out,r22_out,r23_out,r24_out,r25_out,r26_out,r27_out,r28_out,r29_out,r30_out,r31_out,a_data);
	d d2(read_sig,b_addr,r0_out,r1_out,r2_out,r3_out,r4_out,r5_out,r6_out,r7_out,r8_out,r9_out,r10_out,r11_out,r12_out,r13_out,r14_out,r15_out,r16_out,r17_out,r18_out,r19_out,r20_out,r21_out,r22_out,r23_out,r24_out,r25_out,r26_out,r27_out,r28_out,r29_out,r30_out,r31_out,b_data);
	
	
	

endmodule







module dec(E, W, Y);
    input E; // enable
    input [4:0] W;
    output [31:0] Y;
    reg [31:0] Y;
   
    always @(*)
        if (E == 0)
            Y = 32'b00000000000000000000000000000000;
        else
            case (W)
                5'd0:   Y = 32'b10000000000000000000000000000000;
                 5'd1:  Y = 32'b01000000000000000000000000000000;
                 5'd2:  Y = 32'b00100000000000000000000000000000;
                 5'd3:  Y = 32'b00010000000000000000000000000000;
                 5'd4:  Y = 32'b00001000000000000000000000000000;
                 5'd5:  Y = 32'b00000100000000000000000000000000;
                 5'd6:  Y = 32'b00000010000000000000000000000000;
                 5'd7:  Y = 32'b00000001000000000000000000000000;
					  5'd8:  Y = 32'b00000000100000000000000000000000;
					  5'd9:  Y = 32'b00000000010000000000000000000000;
					  5'd10: Y=  32'b00000000001000000000000000000000;
					  5'd11: Y=  32'b00000000000100000000000000000000;
					  5'd12: Y=  32'b00000000000010000000000000000000;
					  5'd13: Y=  32'b00000000000001000000000000000000;
					  5'd14: Y=  32'b00000000000000100000000000000000;
					  5'd15: Y=  32'b00000000000000010000000000000000;
					  5'd16: Y=  32'b00000000000000001000000000000000;
					  5'd17: Y = 32'b00000000000000000100000000000000;
					  5'd18: Y = 32'b00000000000000000010000000000000;
					  5'd19: Y = 32'b00000000000000000001000000000000;
					  5'd20: Y = 32'b00000000000000000000100000000000;
					  5'd21: Y = 32'b00000000000000000000010000000000;
					  5'd22: Y = 32'b00000000000000000000001000000000;
					  5'd23: Y = 32'b00000000000000000000000100000000;
					  5'd24: Y = 32'b00000000000000000000000010000000;
					  5'd25: Y = 32'b00000000000000000000000001000000;
					  5'd26: Y = 32'b00000000000000000000000000100000;
					  5'd27: Y = 32'b00000000000000000000000000010000;
					  5'd28: Y = 32'b00000000000000000000000000001000;
					  5'd29: Y = 32'b00000000000000000000000000000100;
					  5'd30: Y = 32'b00000000000000000000000000000010;
					  5'd31: Y = 32'b00000000000000000000000000000001;
					  
            endcase
endmodule


