
module testbench();

reg enable;
reg [3:0]In;
wire [3:0]Ex;

BuffTri u(enable, In, Ex);

initial begin
  #1
  $display("------------------");
  $display("enable | In || Ex ");
  $display("--------||----");
  $monitor("%b  %b ||  %b", enable, In, Ex);
  enable=0; In=4'b0000;
  #2 enable = 0; In = 4'b0001;
  #2 enable = 1; In = 4'b0000;
  #2 enable = 1; In = 4'b0110;
end

initial
 #10 $finish;

initial begin
  $dumpfile("BufferTri_tb.vcd");
  $dumpvars(0, testbench);
end

endmodule
