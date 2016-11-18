module decoder(input logic  [23:0]inst, output logic [3:0]addr,output logic [7:0]y,output logic [7:0]x,output logic [2:0]op);
		always@(*) begin
		 op = inst[23:21];
		 addr = inst[20:16];
		 x = inst[15:8];
		 y = inst[7:0];
		 end		
endmodule