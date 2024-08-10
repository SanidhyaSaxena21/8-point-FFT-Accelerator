`timescale 1ns / 1ps
module DFF(q,clk,reset,d);
    input d,clk,reset;
    output reg q;
initial begin q=0; end
always @ (posedge (clk)) begin
 if (reset)
  q <= 0;
 else  
 q<= d ;
end
endmodule
