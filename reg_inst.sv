module reg_inst ( 

input logic [23:0] Data_in,
input logic clock, reset,
output logic [23:0] Data_out);

always_ff @ ( posedge reset or posedge clock) 
	if (reset) Data_out <= 24'b0;

else Data_out <= Data_in;

endmodule