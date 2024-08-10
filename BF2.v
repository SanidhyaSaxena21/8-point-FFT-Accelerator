`timescale 1ns / 1ps

module BF2(clk,rst,ar1,ai1,ar2,ai2,cr1,ci1,cr2,ci2);

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

	parameter zro = 16'b0000000000000000;
	wire [15:0] br2,bi2,dr1,dr2,di1,di2,s;
	//_____________________________-j multiplication__________(ar2+jai2)___
	//Create a copy of imaginary part of input and treat it as real 
	assign br2=ai2;
	//Create a negative of real part and treat ts as imaginary 
	addsub ad1(1'b0,zro,ar2,s);
	assign bi2=s;

	assign dr1=ar1+br2;
	assign dr2=ar1-br2;
	assign di1=ai1+bi2;
	assign di2=ai1-bi2;

	reg16 reg1(.y(cr1),.clk(clk),.reset(rst),.a(dr1));
	reg16 reg2(.y(cr2),.clk(clk),.reset(rst),.a(dr2));
	reg16 reg3(.y(ci1),.clk(clk),.reset(rst),.a(di1));
	reg16 reg4(.y(ci2),.clk(clk),.reset(rst),.a(di2));

endmodule
