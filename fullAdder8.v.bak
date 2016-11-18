module fullAdder8(input [7:0] a, b, output reg ovf, output reg [7:0] s);

	reg x, z;
	always@(*) begin
		{x, s[6:0]} = a[6:0] + b[6:0];
		{z,s[7]} = a[7] + b[7] + x;
		ovf = x ^ z;
	end
	
endmodule