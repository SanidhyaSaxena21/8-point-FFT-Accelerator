`timescale 1ns / 1ps
module reg16(y,clk,reset,a);
    input [15:0] a;
    output [15:0] y;
    input clk,reset;
 
DFF d1(y[0],clk,reset,a[0]);
DFF d2(y[1],clk,reset,a[1]);
DFF d3(y[2],clk,reset,a[2]);
DFF d4(y[3],clk,reset,a[3]);
DFF d5(y[4],clk,reset,a[4]);
DFF d6(y[5],clk,reset,a[5]);
DFF d7(y[6],clk,reset,a[6]);
DFF d8(y[7],clk,reset,a[7]);
DFF d9(y[8],clk,reset,a[8]);
DFF d10(y[9],clk,reset,a[9]);
DFF d11(y[10],clk,reset,a[10]);
DFF d12(y[11],clk,reset,a[11]);
DFF d13(y[12],clk,reset,a[12]);
DFF d14(y[13],clk,reset,a[13]);
DFF d15(y[14],clk,reset,a[14]);
DFF d16(y[15],clk,reset,a[15]);

endmodule
