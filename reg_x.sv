module reg_x ( 

input  [7:0] Data_in,
input  clock, reset, ena, 
output reg [7:0] Data_out);

always_ff @ ( posedge reset or posedge clock) 
	if (reset) Data_out <= 8'b0;

else if(ena)Data_out <= Data_in;

endmodule