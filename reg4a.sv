module reg4a ( 

input  [3:0] Data_in,
input  clock, reset,
output  [3:0] Data_out);

always_ff @ ( posedge reset or posedge clock) 
	if (reset) Data_out <= 4'b0;

else Data_out <= Data_in;

endmodule