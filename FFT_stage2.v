`timescale 1ns / 1ps

module FFT_stage2(clk,rst,br0,bi0,br1,bi1,br2,bi2,br3,bi3,br4,bi4,br5,bi5,br6,bi6,br7,bi7,
                         cr0,ci0,cr1,ci1,cr2,ci2,cr3,ci3,cr4,ci4,cr5,ci5,cr6,ci6,cr7,ci7);
								 
input signed [15:0] br0,bi0,br1,bi1,br2,bi2,br3,bi3,br4,bi4,br5,bi5,br6,bi6,br7,bi7;
output signed [15:0] cr0,ci0,cr1,ci1,cr2,ci2,cr3,ci3,cr4,ci4,cr6,ci6;
output signed [15:0] cr5,ci5,cr7,ci7;
input clk,rst;

wire signed [15:0] dr5,di5,dr7,di7;

BF1 m1(.clk(clk),.rst(rst),.ar1(br0),.ai1(bi0),.ar2(br2),.ai2(bi2),.cr1(cr0),.ci1(ci0),.cr2(cr2),.ci2(ci2));
BF1 m2(.clk(clk),.rst(rst),.ar1(br4),.ai1(bi4),.ar2(br6),.ai2(bi6),.cr1(cr4),.ci1(ci4),.cr2(cr6),.ci2(ci6));
BF2 m3(.clk(clk),.rst(rst),.ar1(br1),.ai1(bi1),.ar2(br3),.ai2(bi3),.cr1(cr1),.ci1(ci1),.cr2(cr3),.ci2(ci3));
BF2 m4(.clk(clk),.rst(rst),.ar1(br5),.ai1(bi5),.ar2(br7),.ai2(bi7),.cr1(dr5),.ci1(di5),.cr2(dr7),.ci2(di7));


complex_mul cm1(.clk(clk),.rst(rst),.a(dr5),.b(di5),.R(cr5),.I(ci5));
complex_mul1 cm2(.clk(clk),.rst(rst),.a(dr7),.b(di7),.R(cr7),.I(ci7));
endmodule

