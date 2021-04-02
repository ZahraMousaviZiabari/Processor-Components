module DataMemory(readData,address,writeData,memWrite,memRead);
  output reg [31:0]readData;
  input [31:0]address;
  input [31:0]writeData;
  input memWrite;
  input memRead;
  reg [31:0] dmem [255:0];
  always@(address,memWrite,memRead)
  begin
  #10
    if(memRead) readData=dmem[address];
    else if(memWrite) dmem[address]=writeData;
  end
endmodule