// Flip Flop tipo D

module FFD1b
	( input wire clk, reset, enable,
		input wire D,
		output reg Q);

	  always @(posedge clk or posedge reset) begin
		if (reset)
			Q <= 1'b0;
		else if(enable)
			Q <= D;
    end
endmodule

module FFD2b(
    input wire clk, reset, enable,
    input wire [1:0]D,
    output wire [1:0]Q);

    FFD1b u0(clk, reset, enable, D[0], Q[0]);
    FFD1b u1(clk, reset, enable, D[1], Q[1]);
endmodule

module FFD4b(
    input wire clk, reset, enable,
    input wire [3:0]D,
    output wire [3:0]Q);

    FFD2b u2(clk, reset, enable, D[1:0], Q[1:0]);
    FFD2b u3(clk, reset, enable, D[3:2], Q[3:2]);
endmodule
