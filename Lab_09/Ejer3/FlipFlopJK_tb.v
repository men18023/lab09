module testbench();

reg clk, reset, enable, J, K;
wire Q;

FFJK a(clk, reset, enable, J, K, Q);

always
  #2 clk = ~clk;

initial begin
  #1
  $display("-------------------------------");
  $display("clk | reset | enable | J | K || Q ");
  $display("------------------||------------");
  $monitor("%b  %b  %b  %b  %b ||  %b", clk, reset, enable, J, K, Q);
  reset=0; clk=0; enable=0; J=0; K=0;
  #2 reset = 0;
  #2 reset = 1;
  #2 reset = 0;
  #2 enable = 1; J = 1;
  #2 enable = 0;
  #2 enable = 1; J = 0;
  #2 K = 1;
  #2 K = 0; J = 1;
  #2 K = 1;
end

initial
  #20 $finish;
initial begin
  $dumpfile("FlipFlopJK_tb.vcd");
  $dumpvars(0, testbench);
end

endmodule
