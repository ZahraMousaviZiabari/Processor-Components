module osc(out);
  output reg out;
  always
  begin
    #100
    out = 1'b1;
    #100
    out =  1'b0;
  end
endmodule