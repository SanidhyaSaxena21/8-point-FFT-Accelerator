`timescale 1ns / 1ps

module complex_mul1(clk,rst,a,b,R,I);

input signed [15:0] a,b;
output signed [15:0] R,I;
input clk,rst;
wire signed [15:0] s1,s2,s3,s4;
wire signed [31:0] s5,s6;
wire signed [15:0] xr,xi;

addsub ad1(1'b0,a, b, s1);  //S1=a-b
addsub ad2(1'b1,a, b, s2);  //S2=a+b

reg16 f1(s3,clk,rst,s1);
reg16 f2(s4,clk,rst,s2);

parameter signed w1r=16'b0000000010110101;
parameter signed w2r=16'b1111111101001011;

assign s5=s3*w2r; //s5=-(a-b)*0.707
assign s6=s4*w2r; //s6=-(a+b)*0.707

assign R={s5[31],s5[22:8]};
assign I={s6[31],s6[22:8]};

//Constant_mul cm1(clk,rst,s3,s5);
//Constant_mul cm2(clk,rst,s4,s6);

//reg16 f3(R,clk,rst,xr);
//reg16 f4(I,clk,rst,xi);
endmodule
