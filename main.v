 
module main();
  
  wire osc_clk,regDst,branch,memRead,memtoReg,memWrite,aluSrc,regWrite,and_mux,zero;
  wire [1:0] aluOp;
  wire [31:0] in_pc;
  wire [31:0] pc_im;
  wire [31:0] im_out;
  wire [31:0] mux32_regg;
  wire [31:0] mux5_regg;  
  wire [31:0] regg_alu;
  wire [31:0] regg_mux32;
  wire [31:0] mux32_alu;
  wire [31:0] extend_out;
  wire [31:0] alu_result;
  wire [31:0] mem_readData;
  wire [31:0] counter_out;
  wire [31:0] shift_result;
  wire [31:0] alu_mux;
  wire [3:0] aluControl_alu;
  
  
  osc oscm(osc_clk);
  PC pcm(pc_im,in_pc,osc_clk);
  insMemory im(im_out,pc_im);
  mux5 muxim(mux5_regg,im_out[20:16],im_out[15:11],regDst);
  regs regg(regg_alu,regg_mux32,im_out[25:21],im_out[20:16],regWrite,mux5_regg,mux32_regg,osc_clk);
  alu alum(alu_result,zero,aluControl_alu,regg_alu,mux32_alu);
  mux32 muxreg(mux32_alu,extend_out,regg_mux32,aluSrc);
  extend extendm(extend_out,im_out[15:0]);
  DataMemory mem(mem_readData,alu_result,regg_mux32,memWrite,memRead);
  mux32 muxmem(mux32_regg,mem_readData,alu_result,memtoReg);
  FullAdder alu_counter(counter_out,pc_im,4);  
  shift shifter(shift_result,extend_out);
  FullAdder alu_from_counter(alu_mux,counter_out,shift_result);
  and andm(and_mux,zero,branch);
  mux32 muxpc(in_pc,alu_mux,counter_out,and_mux);
  control controlm(regDst,branch,memRead,memtoReg,aluOp,memWrite,aluSrc,regWrite,im_out[31:26]);
  aluControl aluControlm(aluControl_alu,aluOp,im_out[5:0]);
  
endmodule