module aluControl(out,AluOp,ins_in);

		
input wire [5:0] ins_in;
		
input wire [1:0] AluOp;
		
output reg [3:0] out;

	
reg [3:0] for10aluop;


	
always @(*) 
	
begin
	 
 #10
		
case(ins_in[3:0])			
4'd0:  for10aluop = 4'd2;//add
	
4'd2:  for10aluop = 4'd6;//sub
	
4'd5:  for10aluop = 4'd1;//or
			
4'd6:  for10aluop = 4'd13;//xor
			
4'd7:  for10aluop = 4'd12;//nor
			
4'd10: for10aluop = 4'd7;//slt
			
default: for10aluop = 4'd0;
		
endcase
	
end

  
	

always @(*)
	
begin
	 

 #10
		
case(AluOp)
			
2'd0: out = 4'd2;	//add
			
2'd1: out = 4'd6;	//sub
			
2'd2: out = for10aluop;// for 10
			
2'd3: out = 4'd2;	//add
			
default: out = 0;
		
endcase
	
end

endmodule
