
// Quartus Prime Verilog Template
// Single port RAM with single read/write address 

module single_port_ram 
(
	input [7:0] data,
	input [4:0] addr,
	input we, clk,
	output [7:0] q
);

	// Declare the RAM variable
	reg [7:0] ram[31:0];

	// Variable to hold the registered read address
	reg [4:0] addr_reg;

	always @ (posedge clk)
	begin
		// Write
		if (we)
			ram[addr] <= data;
		addr_reg <= addr;
	end

	// Continuous assignment implies read returns NEW data.
	// This is the natural behavior of the TriMatrix memory
	// blocks in Single Port mode.  
	assign q = ram[addr_reg];

endmodule