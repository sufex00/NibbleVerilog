module reg_x ( 

input logic [7:0] Data_in,
input logic clock, reset,
output logic [7:0] Data_out);

always_ff @ ( posedge reset or posedge clock) 
	if (reset) Data_out <= 8'b0;

else Data_out <= Data_in;

endmodule