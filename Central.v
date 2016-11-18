module Central(clk, OP, reset, mux_X, ENA_1, mux_Y, ENA_2, out_we);
	input		clk;
	input		reset;
	input		[2:0] OP;
	
	
	output reg	mux_X;
	output reg	mux_Y;
	output reg	ENA_1;
	output reg	ENA_2;
	output reg	out_we;

	reg [2:0] 	state;
	reg [2:0] 	nextstate;

	parameter	S0 = 3'b000;
	parameter	S1 = 3'b001;
	parameter	S2 = 3'b010;
	parameter	S3 = 3'b011;
	parameter	S4 = 3'b100;
	parameter	S5 = 3'b101;
	parameter	S6 = 3'b110;
	parameter	S7 = 3'b111;

// State Register

always @( * )
begin
	mux_X <= OP[1];
	mux_Y <= OP[0];
	ENA_2 <= state[2];
	ENA_1 <= ~state[2];
end
 
always @(negedge clk or posedge reset)
begin
	if (reset) 	state <= S0;
	else		state <= nextstate;
	
end
// Next State Logic

always @(state)
begin
	
	out_we <= 0;
	case (state)
		S0: 
			nextstate <= S1;
		S1: 
			nextstate <= S2;
		S2: 
			nextstate <= S3;
		S3:
			begin
				if(OP[0] == 1)
				begin
					nextstate <= S4;
					out_we <= 1;
				end
				else
					nextstate <= S5;
			end
		S4:
			nextstate <= S5;
		S5:
			nextstate <= S6;
		S6:
			nextstate <= S7;
		S7:
			nextstate <= S3;
		default: nextstate <= S0;
	endcase


	
end


// Output Logic

//assign out = (state == S2);

endmodule