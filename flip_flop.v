//active high signal rest
module d_flip_flop(D,Clock,Reset,Q,Qbar);
	input D,Clock,Reset;
	output Q,Qbar;
	
	
	wire cbar,clkbar,s,r,rbar,sbar;
	
	not n11(cbar,Reset);
	not n22(clkbar,Clock);
	
	
	nand n1(sbar,s,rbar);
	nand n2(s,sbar,cbar,clkbar);
	nand n3(r,s,rbar,clkbar);
	nand n4(rbar,D,cbar,r);
	
	nand n5(Q,Qbar,s);
	nand n6(Qbar,Q,r,cbar);
endmodule
	
	
	
	
		
