`timescale 1ns / 1ps
module test();
	reg CLOCK_50;
	reg Rest,read_sig,write_sig;
	reg [4:0]a_addr,b_addr,d_addr;
	reg [31:0]writeback_data;
	wire [31:0]a_data,b_data;
	wire rin;
	parameter CLOCK_PERIOD=2;
	wire [31:0]r0_out_o,r1_out_o,r2_out_o;
	register_file file (CLOCK_50,Rest,a_addr,b_addr,d_addr,read_sig,write_sig,writeback_data,a_data,b_data,r0_out_o,r1_out_o,r2_out_o,rin);
	
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
	
	Rest=1;
	read_sig=1;
	writeback_data=32'd0;
	end
	
	

	
	
	
	initial
	begin
	#2;Rest=0;
	#2;a_addr=1;b_addr=2;d_addr=1;writeback_data=32'd1;read_sig=1;write_sig=1;//wirte 1 on r1
	#2;a_addr=1;b_addr=2;d_addr=2;writeback_data=32'd2;read_sig=1;write_sig=1;//wirte 2 on r2
	#2;a_addr=1;b_addr=2;d_addr=2;writeback_data=32'd2;read_sig=1;write_sig=0;
	//it should read 0/0 and write 1 on r1
	// it should read 1/0 and write 2 on r2
	//it should only read 1/2

	

		
	
	
	
	
	
	
	
	
	
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
