// FlipFlop tipo T

module FF1b(
  input wire clk, enable, reset,
  input wire D,
  output reg Q);

  always @(posedge clk or posedge reset) begin
    if(reset)
      Q <= 0;
    else if(enable)
      Q <= D;
  end
endmodule

module FFT(
  input wire clk, reset, enable,
  output wire Q);

  FF1b u(clk, reset, enable, ~Q, Q);
endmodule
