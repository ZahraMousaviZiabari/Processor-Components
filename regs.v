module regs(A,B,R1,R2,W,WAd,Data,Clk);
  output [31:0]A;
  output [31:0]B;
  input [4:0]R1;
  input [4:0]R2;
  input [4:0]WAd;//mulltiplexer is added to this input
  input [31:0]Data;
  input W;
  input Clk;
  reg [31:0] imem [31:0];
  
  integer i; 
  initial
  begin
    for ( i=0; i<32; i=i+1) //all registers equal to zero
      imem[i] = 32'b0;
     //defining some registers for test
     imem[18] = 2;
     imem[17] = 4;
     imem[16] = 1;
  end
  
  always@(posedge Clk,W)
  begin
    #10
    imem[WAd] = Data;
    
  end
  
  assign A = imem[R1];
  assign B = imem[R2];
endmodule