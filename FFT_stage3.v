`timescale 1ns / 1ps

module FFT_stage3(clk,rst,cr0,ci0,cr1,ci1,cr2,ci2,cr3,ci3,cr4,ci4,cr5,ci5,cr6,ci6,cr7,ci7,
                         dr0,di0,dr1,di1,dr2,di2,dr3,di3,dr4,di4,dr5,di5,dr6,di6,dr7,di7);
								 
input signed [15:0] cr0,ci0,cr1,ci1,cr2,ci2,cr3,ci3,cr4,ci4,cr5,ci5,cr6,ci6,cr7,ci7;
output signed [15:0] dr0,di0,dr1,di1,dr2,di2,dr3,di3,dr4,di4,dr5,di5,dr6,di6,dr7,di7;
input clk,rst;


BF1 m1(.clk(clk),.rst(rst),.ar1(cr0),.ai1(ci0),.ar2(cr4),.ai2(ci4),.cr1(dr0),.ci1(di0),.cr2(dr4),.ci2(di4));
BF1 m2(.clk(clk),.rst(rst),.ar1(cr1),.ai1(ci1),.ar2(cr5),.ai2(ci5),.cr1(dr1),.ci1(di1),.cr2(dr5),.ci2(di5));
BF2 m3(.clk(clk),.rst(rst),.ar1(cr2),.ai1(ci2),.ar2(cr6),.ai2(ci6),.cr1(dr2),.ci1(di2),.cr2(dr6),.ci2(di6));
BF1 m4(.clk(clk),.rst(rst),.ar1(cr3),.ai1(ci3),.ar2(cr7),.ai2(ci7),.cr1(dr3),.ci1(di3),.cr2(dr7),.ci2(di7));


endmodule

