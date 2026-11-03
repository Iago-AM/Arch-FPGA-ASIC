`timescale 1ns/10ps

module AND4X1HVT (Y, A, B, C, D);
	output Y;
	input A, B, C, D;

	// Function
	and (Y, A, ~B, ~C, D);

	// Timing
	specify
		(A => Y) = 0;
		(B => Y) = 0;
		(C => Y) = 0;
		(D => Y) = 0;
	endspecify
endmodule