module shiftlogic(left,regis,samt,out);
	input left;
	input [31:0]regis;
	input[4:0]samt;
	output reg [31:0]out;
	
	always@(*)
	if(left)
		out<=regis<<samt;
	else //thismeansshiftright
	out<=regis>>samt;
endmodule
