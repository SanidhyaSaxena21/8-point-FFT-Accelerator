`timescale 1ns / 1ps

module FFT_stage1(clk,rst,ar0,ai0,ar4,ai4,ar2,ai2,ar6,ai6,ar1,ai1,ar5,ai5,ar3,ai3,ar7,ai7,
                          br0,bi0,br1,bi1,br2,bi2,br3,bi3,br4,bi4,br5,bi5,br6,bi6,br7,bi7);
								  
input signed [15:0] ar0,ai0,ar4,ai4,ar2,ai2,ar6,ai6,ar1,ai1,ar5,ai5,ar3,ai3,ar7,ai7;
output signed [15:0] br0,bi0,br1,bi1,br2,bi2,br3,bi3,br4,bi4,br5,bi5,br6,bi6,br7,bi7;
input clk,rst;
	 
BF1 m1(.clk(clk),.rst(rst),.ar1(ar0),.ai1(ai0),.ar2(ar4),.ai2(ai4),.cr1(br0),.ci1(bi0),.cr2(br1),.ci2(bi1));
BF1 m2(.clk(clk),.rst(rst),.ar1(ar2),.ai1(ai2),.ar2(ar6),.ai2(ai6),.cr1(br2),.ci1(bi2),.cr2(br3),.ci2(bi3));
BF1 m3(.clk(clk),.rst(rst),.ar1(ar1),.ai1(ai1),.ar2(ar5),.ai2(ai5),.cr1(br4),.ci1(bi4),.cr2(br5),.ci2(bi5));
BF1 m4(.clk(clk),.rst(rst),.ar1(ar3),.ai1(ai3),.ar2(ar7),.ai2(ai7),.cr1(br6),.ci1(bi6),.cr2(br7),.ci2(bi7));
endmodule

