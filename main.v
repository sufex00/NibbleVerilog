module main(clk, clrn, out);
	input		clk;
	input		clrn;
	
	output	reg [7:0] out;
	
	
	Central	center(clk, op, clrn, mux_X, ENA_1, mux_Y, ENA_2, out_we);
	
	wire		[4:0] PC_out, PC_in;
	
	reg5a 				PC 	(PC_in, clk, clrn, ENA_1, PC_out);
	sum1					ADD1	(PC_out, ovf1, PC_in);
	
	wire		[23:0] 	rom_out;
	single_port_rom	rom	(PC_out, clk, rom_out);
	
	wire		[3:0] addr;
	wire		[7:0] x, y;
	wire		[2:0]	op;
	decoder				DEC	(rom_out, addr, y , x, op);
	
	wire		[7:0] s;
	complement2			COMP	(x, ovf2, s);
	
	wire		[7:0]mux_x_out;
	mux2					MUX2_X(x, s, mux_X, mux_x_out);
	
	wire		[7:0]mux_y_out;
	mux2					MUX2_y(ram_out, y, mux_Y, mux_y_out);
	
	wire		[7:0] Ad8_out;
	fullAdder8			Add8	(mux_x_out,mux_y_out, ovf3,Add8_out);
	
	wire		[7:0]	reg_R_out;
	reg_x					reg_R	(Add8_out, clk, clrn, ENA_2, reg_R_out);
	
	wire		[7:0] ram_out;
	single_port_ram 	ram	(reg_R_out, addr, out_we, clk, ram_out);
	
	always @(negedge clk)
	begin
		out<= reg_R_out;
	end
	
	
	
endmodule