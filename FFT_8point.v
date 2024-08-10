`timescale 1ns / 1ps

module FFT_8point(clk,rst,in0_real,in1_real,in2_real,in3_real,in4_real,in5_real,in6_real,in7_real,in0_imag,in1_imag,in2_imag,in3_imag,in4_imag,in5_imag,in6_imag,in7_imag
 ,out0_real,out1_real,out2_real,out3_real,out4_real,out5_real,out6_real,out7_real,start,write,ready,out0_imag,out1_imag,out2_imag,out3_imag,out4_imag,out5_imag,out6_imag,out7_imag);

input signed [15:0] in0_real,in1_real,in2_real,in3_real,in4_real,in5_real,in6_real,in7_real;
input signed [15:0] in0_imag,in1_imag,in2_imag,in3_imag,in4_imag,in5_imag,in6_imag,in7_imag;
output reg signed [15:0] out0_real,out1_real,out2_real,out3_real,out4_real,out5_real,out6_real,out7_real;
output reg signed [15:0] out0_imag,out1_imag,out2_imag,out3_imag,out4_imag,out5_imag,out6_imag,out7_imag;
reg signed [15:0] ar0,ar1,ar2,ar3,ar4,ar5,ar6,ar7;
reg signed [15:0] ai0,ai1,ai2,ai3,ai4,ai5,ai6,ai7;
wire signed [15:0] br0,bi0,br1,bi1,br2,bi2,br3,bi3,br4,bi4,br5,bi5,br6,bi6,br7,bi7;
wire signed [15:0] cr0,ci0,cr1,ci1,cr2,ci2,cr3,ci3,cr4,ci4,cr5,ci5,cr6,ci6,cr7,ci7;
wire signed [15:0] dr0,dr1,dr2,dr3,dr4,dr5,dr6,dr7;
wire signed [15:0] di0,di1,di2,di3,di4,di5,di6,di7;
reg [2:0] step;
output reg ready;
input start;
input write;
reg done;

always @(posedge clk or posedge rst) begin
	if(rst) begin
		{ar0,ar1,ar2,ar3,ar4,ar5,ar6,ar7}<=128'd0;
		{ai0,ai1,ai2,ai3,ai4,ai5,ai6,ai7}<=128'd0;
		ready<=1'b0;
		done<=1'b0;
	end
	else begin
		if(start) begin
			step<=step+1;
		end
		else if (done) begin
			{out0_real,out1_real,out2_real,out3_real,out4_real,out5_real,out6_real,out7_real}<={dr0,dr1,dr2,dr3,dr4,dr5,dr6,dr7};
			{out0_imag,out1_imag,out2_imag,out3_imag,out4_imag,out5_imag,out6_imag,out7_imag}<={di0,di1,di2,di3,di4,di5,di6,di7};
			ready<=1'b1;
		end
		else begin
			if(write) begin
				{ar0,ar1,ar2,ar3,ar4,ar5,ar6,ar7}<={in0_real,in1_real,in2_real,in3_real,in4_real,in5_real,in6_real,in7_real};
				{ai0,ai1,ai2,ai3,ai4,ai5,ai6,ai7}<={in0_imag,in1_imag,in2_imag,in3_imag,in4_imag,in5_imag,in6_imag,in7_imag};
				step<=3'd0;
				ready<=1'b0;
				done<=1'b0;
			end
		end
	end
end
always @(posedge clk or posedge rst) begin
	if(rst)
		step<=3'd0;
	else begin
		if(step==3'd3) begin
			done<=1'b1;
		end
		else begin
			step<=step+1;
		end
	end
end
input clk,rst;
FFT_stage1 stg1(clk,rst,ar0,ai0,ar4,ai4,ar2,ai2,ar6,ai6,ar1,ai1,ar5,ai5,ar3,ai3,ar7,ai7,
                          br0,bi0,br1,bi1,br2,bi2,br3,bi3,br4,bi4,br5,bi5,br6,bi6,br7,bi7);
								  
FFT_stage2 stg2(clk,rst,br0,bi0,br1,bi1,br2,bi2,br3,bi3,br4,bi4,br5,bi5,br6,bi6,br7,bi7,
                         cr0,ci0,cr1,ci1,cr2,ci2,cr3,ci3,cr4,ci4,cr5,ci5,cr6,ci6,cr7,ci7);
FFT_stage3 stg3(clk,rst,cr0,ci0,cr1,ci1,cr2,ci2,cr3,ci3,cr4,ci4,cr5,ci5,cr6,ci6,cr7,ci7,
                         dr0,di0,dr1,di1,dr2,di2,dr3,di3,dr4,di4,dr5,di5,dr6,di6,dr7,di7);
					 
endmodule
