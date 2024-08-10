`timescale 1ns / 1ps

module addsub (add,a, b, s);
  input add;
  input [15 : 0] a;
  input [15 : 0] b;
  output [15 : 0] s;
  assign s = (add)? (a + b) : (a - b);
endmodule
