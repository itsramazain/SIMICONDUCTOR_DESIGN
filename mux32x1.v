module d(E,add,i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,i27,i28,i29,i30,i31,out);
	input [4:0]add;
	input [31:0]i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,i27,i28,i29,i30,i31;
	output reg [31:0]out;
	input E;
	always @(*)
	begin
	if (!E)
		out=32'bx;
	else
	begin
	case(add)
	
	5'd0:out=i0;
	5'd1:out=i1;
	5'd2:out=i2;
	5'd3:out=i3;
	5'd4:out=i4;
	5'd5:out=i5;
	5'd6:out=i6;
	5'd7:out=i7;
	5'd8:out=i8;
	5'd9:out=i9;
	5'd10:out=i10;
	5'd11:out=i11;
	5'd12:out=i12;
	5'd13:out=i13;
	5'd14:out=i14;
	5'd15:out=i15;
	5'd16:out=i16;
	5'd17:out=i17;
	5'd18:out=i18;
	5'd19:out=i19;
	5'd20:out=i20;
	5'd21:out=i21;
	5'd22:out=i22;
	5'd23:out=i23;
	5'd24:out=i24;
	5'd25:out=i25;
	5'd26:out=i26;
	5'd27:out=i27;
	5'd28:out=i28;
	5'd29:out=i29;
	5'd30:out=i30;
	5'd31:out=i31;
	
	endcase
	end
	end
	
endmodule
