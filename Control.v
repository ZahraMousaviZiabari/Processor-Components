module control(RegDst,Branch,MemRead,MemtoReg,AluOp,MemWrite,AluSrc,RegWrite,in);
input [5:0] in;
output reg RegDst,Branch,MemRead,MemtoReg,MemWrite,AluSrc,RegWrite;
output reg [1:0] AluOp;

always@(in)
begin
#10
    //the defaults (R-Type)
    AluOp[1:0]	= 2'b10;
		AluSrc		= 0;
		Branch	= 0;
		MemRead		= 0;
		MemtoReg	= 0;
		MemWrite	= 0;
		RegDst		= 1;
		RegWrite	= 1;

case(in)
    35:   //lw
    begin
        RegDst = 0;
        RegWrite = 1;
        AluSrc = 1;
        MemtoReg	= 1;
  				MemRead  = 1;
				AluOp[1] = 0;
      end
        
    43:   //sw
    begin
        MemWrite = 1;
				AluOp[1] = 0;
				AluSrc   = 1;
				RegWrite = 0;
    end
    4:    //beq
    begin
      AluOp[0] = 1;
			AluOp[1] = 0;
			Branch = 1;
			RegWrite = 0;
    end
    8:    //addi
    begin
        RegDst = 0;
				AluOp[1] = 0;
				AluSrc = 1;
    end
    0:   //R-Type
    begin
      end
    endcase
  end
  
endmodule