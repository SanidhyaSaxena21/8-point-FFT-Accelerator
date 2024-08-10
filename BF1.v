module BF1 (clk,rst,ar1,ai1,ar2,ai2,cr1,ci1,cr2,ci2);

	input signed [15:0] ar1;      //Real part A
	input signed [15:0] ai1;      //Img Part A
	input signed [15:0] ar2;	//Real part B
	input signed [15:0] ai2;	//Imp part B
	output signed [15:0] cr1;
	output signed [15:0] ci1;
	output signed [15:0] cr2;
	output signed [15:0] ci2;
	input clk;
	input rst;
	
	wire signed [15:0] br1,bi1,br2,bi2;

	assign br1=ar1+ar2;
	assign br2=ar1-ar2;
	assign bi1=ai1+ai2;
	assign bi2=ai1-ai2;

	reg16 reg1(.y(cr1),.clk(clk),.reset(rst),.a(br1));
	reg16 reg2(.y(cr2),.clk(clk),.reset(rst),.a(br2));
	reg16 reg3(.y(ci1),.clk(clk),.reset(rst),.a(bi1));
	reg16 reg4(.y(ci2),.clk(clk),.reset(rst),.a(bi2));
	//May need a FLOP for pipelining 
endmodule
