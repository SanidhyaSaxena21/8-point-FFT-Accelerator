`timescale 1ns/1ps

module FFT_tb ();

	parameter CLOCK_PERIOD = 100; // 10 MHz clock
	parameter NUM_TEST = 1000; // Number of tests

	reg sys_clk, sys_rst_n;
	reg [3:0] state;
	reg en_a, en_b;
	reg write, start;
	reg [9:0] test_err;
	reg [9:0] test_count;
	reg [15:0] in_r0,in_i0,in_r1,in_i1,in_r2,in_i2,in_r3,in_i3,in_r4,in_i4,in_r5,in_i5,in_r6,in_i6,in_r7,in_i7;
	wire signed [15:0] out_r0,out_i0,out_r1,out_r2,out_i2,out_r3,out_i3,out_r4,out_i4,out_r5,out_i5,out_r6,out_i6,out_r7,out_i7;
	wire signed [8:-7] out_i1;
	real a;
	//wire [255:0] a, b;
	//wire [256:0] s_out, s_golden;
	wire ready;

	
	FFT_8point u_DUT(.clk(sys_clk),.rst(!sys_rst_n),.in0_real(in_r0),.in0_imag(in_i0),.in1_real(in_r1),.in1_imag(in_i1),.in2_real(in_r2),.in2_imag(in_i2),.in3_real(in_r3),.in3_imag(in_i3),.in4_real(in_r4),.in4_imag(in_i4),.in5_real(in_r5),.in5_imag(in_i5),.in6_real(in_r6),.in6_imag(in_i6),.in7_real(in_r7),.in7_imag(in_i7),.out0_real(out_r0),.out0_imag(out_i0),.out1_real(out_r1),.out1_imag(out_i1),.out2_real(out_r2),.out2_imag(out_i2),.out3_real(out_r3),.out3_imag(out_i3),.out4_real(out_r4),.out4_imag(out_i4),.out5_real(out_r5),.out5_imag(out_i5),.out6_real(out_r6),.out6_imag(out_i6),.out7_real(out_r7),.out7_imag(out_i7),.ready(ready),.start(start),.write(write));

	always @(posedge sys_clk) begin
		if(sys_rst_n == 1'b1) begin
			assign in_r0=16'b0000000_000000000;
			assign in_i0=16'b00000000_00000000;
			assign in_r1=16'b00000001_00000000;
			assign in_i1=16'b00000000_00000000;
			assign in_r2=16'b00000010_00000000;
			assign in_i2=16'b00000000_00000000;
			assign in_r3=16'b00000011_00000000;
			assign in_i3=16'b00000000_00000000;
			assign in_r4=16'b00000100_00000000;
			assign in_i4=16'b00000000_00000000;
			assign in_r5=16'b00000101_00000000;
			assign in_i5=16'b00000000_00000000;
			assign in_r6=16'b00000110_00000000;
			assign in_i6=16'b00000000_00000000;
			assign in_r7=16'b00000111_00000000;
			assign in_i7=16'b00000000_00000000;

		end
	end
	//assign s_golden = {1'b0, a} + {1'b0, b};
	localparam SF= 2.0**-9.0;
	always @(posedge sys_clk) begin
		if (sys_rst_n == 1'b1) begin
			if (state == 4'h0) begin
				if (test_count == 0) begin
					state <= 4'h1;
				end
			end
			if (state == 4'h1) begin
				//en_a <= 1'b0; en_b <= 1'b0; 
				write <= 1'b1;
				state <= 4'h2;
			end
			if (state == 4'h2) begin
				start <= 1'b1; write <= 1'b0;
				state <= 4'h3;
			end
			if (state == 4'h3) begin
				start <= 1'b0;
				if (ready) begin
					$display("X0:  %f+j%f",$itor(out_r0)*(2.0**-8),$itor(out_i0)*(2.0**-8));
					$display("X1:  %f+j%f",$itor(out_r1)*(2.0**-8),$itor(out_i1)*(2.0**-8));
					$display("X2:  %f+j%f",$itor(out_r2)*(2.0**-8),$itor(out_i2)*(2.0**-8));
					$display("X3:  %f+j%f",$itor(out_r3)*(2.0**-8),$itor(out_i3)*(2.0**-8));
					$display("X4:  %f+j%f",$itor(out_r4)*(2.0**-8),$itor(out_i4)*(2.0**-8));
					$display("X5:  %f+j%f",$itor(out_r5)*(2.0**-8),$itor(out_i5)*(2.0**-8));
					$display("X6:  %f+j%f",$itor(out_r6)*(2.0**-8),$itor(out_i6)*(2.0**-8));
					$display("X7:  %f+j%f",$itor(out_r7)*(2.0**-8),$itor(out_i7)*(2.0**-8));
					#60 $finish;
				end
			end
		end
    	end

	// End of simulation
	initial begin
		//#10000 $finish;
	end

	// Initial conditions
	initial begin
	    	sys_clk = 1'b0; sys_rst_n = 1'b0;
        	en_a = 1'b0; en_b = 1'b0;
		state = 4'h0;
		write = 1'b0; start = 1'b0;
        	test_err = 0; test_count = 0;
		#CLOCK_PERIOD sys_rst_n = 1'b1;
		#(CLOCK_PERIOD/2) $display("START OF SIMULATION (Time: %g ns)", $time);
    	end


	// VCD dump
	initial begin
		$dumpfile("FFT_tb.vcd");
		$dumpvars(0, u_DUT);
	end

	// System clock generator
	always begin
		#(CLOCK_PERIOD/2) sys_clk = ~sys_clk;
	end

endmodule

