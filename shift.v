module shift(out,in);
	input [31:0] in,out;
	assign out = in<<2;
endmodule
