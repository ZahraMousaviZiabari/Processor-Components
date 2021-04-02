module PC(out,in,osc);
  output reg [31:0] out;
  input [31:0] in;
  input osc;
  
  initial
  begin
    out = 32'd0;
  end
  always@(posedge osc)
  begin
    #10
    out = in;
  end
  
endmodule



