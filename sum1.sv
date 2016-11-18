module sum1(input [4:0] a, output reg ovf, output reg [4:0] s);

	reg x, z;
	always@(*) begin
		{x, s[3:0]} = a[3:0]+ 4'b0001;
		{z,s[4]} = a[4] + x;
		ovf = x ^ z;
	end
	
endmodule