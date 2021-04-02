module FullAdder(sum,A,B);
  input [31:0]A;
  input [31:0]B;
  output [31:0] sum;
  assign sum = A + B;
  
endmodule