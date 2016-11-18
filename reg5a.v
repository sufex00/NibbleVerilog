module reg5a ( 

input  [4:0] Data_in,
input  clock, reset, ena, 
output reg  [4:0] Data_out);

always @ ( posedge reset or negedge clock) 
	if (reset) Data_out <= 5'b0;

else 
	if(ena)Data_out <= Data_in;

endmodule