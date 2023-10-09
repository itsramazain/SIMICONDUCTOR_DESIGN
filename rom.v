///byte adressable memory with 4294967296 locations 


module rom(pc_addr,instruction);
		input [32:0]pc_addr;
		output [32:0] instruction;
		reg [7:0]rom [0:1023];
		
		
		//this part is supposed to be conected to a hex file but i cannot figrue it out yet!
		
			initial //for testing
				begin
					$readmemh("C:\\Users\\HP\\Desktop\\compition\\code.txt",rom);
				end

		
		
		
		assign instruction=rom[pc_addr];

endmodule 
