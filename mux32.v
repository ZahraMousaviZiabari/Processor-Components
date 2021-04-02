module mux32(out,input0,input1,select);
  input [31:0] input0,input1;
  input select;
  output [31:0] out;
  assign out = (select==1'b0) ? input1:input0;
endmodule