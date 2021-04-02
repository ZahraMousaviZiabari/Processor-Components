module insMemory(out,Data);
  output reg [31:0]out;
  input [31:0]Data;
  reg [31:0]ins_address;// added for converting word address to ins address
  reg [31:0] imem [255:0];
  initial
  begin
    
    imem[0] = 32'b00000010010100001000100000100110; //xor $S1,$S2,$S0
    imem[1] = 32'b00000010001100100100000000100000; //add $t0,$S1,$S2
    imem[2] = 32'b00000010010100001000100000100010; //sub $S1,$S2,$S0
    imem[3] = 32'b00000010010100001000100000100100; //and $S1,$S2,$S0
    imem[4] = 32'b00100000000100001111111111111000; //addi $S0,$zero,-8 *teacher suggestion*
    imem[5] = 32'h20110008;                         //addi $S1,$zero,8  *teacher suggestion*
    imem[6] = 32'h02119020;                         //add $S2,$S0,$S1   *teacher suggestion*
    imem[7] = 32'h1240fffc;                         //beq $S2,$zero,-4  *teacher suggestion*
                                                    //(this goes back to imem[1])
    
    //some registers are initialized at insMemory.v for testing.other registers are zero
    //$t0=0  $S0=1  $S1=4  $S2=2
    
  end
  always
  begin
    #10
    if(Data>255) out=0;
    else 
      begin
        ins_address = Data>>2;
        out=imem[ins_address];
      end
  end
    
endmodule