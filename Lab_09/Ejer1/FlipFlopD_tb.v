
module testbench();

wire Q;
wire [1:0]Q2;
wire [3:0]Q4;
reg D;
reg [1:0]D2;
reg [3:0]D4;
reg clk, reset, enable;


FFD1b F1(clk, reset, enable, D, Q);
FFD2b F2(clk, reset, enable, D2, Q2);
FFD4b F3(clk, reset, enable, D4, Q4);

always
  #2 clk <= ~clk;
  initial begin
    $display("-------------------------------------");
    $display("clk | reset | enable | D | D2 | D4 || Q | Q2 | Q4");
    $display("-----------------------------------||------------");
    $monitor("%b  %b  %b  %b  %b  %b  ||  %b  %b  %b", clk, reset, enable, D, D2, D4, Q, Q2, Q4);
    reset=0; clk=0; enable=0; D=1'b1; D2=2'b10; D4= 4'b0110;
    #4 reset = 1;
    #4 reset = 0;
    #4 enable = 1;
    #4 enable = 1;
  end
  initial
  #20 $finish;

  initial begin
    $dumpfile("FlipFlopD_tb.vcd");
    $dumpvars(0, testbench);
  end

endmodule
