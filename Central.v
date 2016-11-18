module Central(clk, OP, reset, mux_X, ENA_1, mux_Y, ENA_2, out_we, out);
	input		clk;
	input		reset;
	input		[2:0] OP;
	
	
	output		mux_X;
	output		mux_Y;
	output		ENA_1;
	output		ENA_2;
	output reg		out_we;
	output reg	[2:0] out;

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

always @(negedge clk or posedge reset)
begin
	if (reset) 	state <= S0;
	else		state <= nextstate;
	
   out <= state; 
end
// Next State Logic

always @(state)
begin
	case (state)
	out_we <= 0;
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