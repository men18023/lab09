// FlipFlop tipo JK

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

module FFJK(
  input wire clk, reset, enable, J, K,
  output wire Q);

    wire nQ, nK, aJ, ak, q;

    not(nQ, Q);
    not(nK, K);
    and(aJ, J, nQ);
    and(aK, nK, Q);
    or(q, aJ, aK);

    FF1b u(clk, reset, enable, Q, q);
endmodule
