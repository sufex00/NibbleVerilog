module complement2(input [7:0] a, output reg ovf, output reg [7:0] s);

	reg x, z;
	always@(*) begin
		{x, s[6:0]} = ~a[6:0] +  7'b1;
		{z,s[7]} = a[7] + x;
		ovf = x ^ z;
	end	
endmodule