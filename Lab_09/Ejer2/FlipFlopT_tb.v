
module testbench();

reg clk, reset, enable;
wire Q;

FFT a(clk, reset, enable, Q);

always
  #2 clk = ~clk;

initial begin
  #1
  $display("-------------------------------");
  $display("clk | reset | enable || Q ");
  $display("------------------||------------");
  $monitor("%b  %b  %b  ||  %b", clk, reset, enable, Q);
  reset=0; clk=0; enable=0;
  #2 reset = 1;
  #2 reset = 0;
  #2 enable = 1;
  #4 enable = 0;
end

initial
  #20 $finish;
initial begin
$dumpfile("FlipFlopT_tb.vcd");
$dumpvars(0, testbench);
end

endmodule
