
module testbench();

reg enable;
reg [6:0]In;
wire [12:0]Ex;

TROM a(enable, In, Ex);

initial begin
  #1
  $display("-------------------------------");
  $display("enable | In || Ex ");
  $display("------------------||------------");
  $monitor("%b  %b  ||  %b", enable, In, Ex);
  enable=0; In=7'b0101010;
  #2 enable = 1; In = 7'b0101010;
  #2 In = 7'b0000101;
  #2 In = 7'bxxxxxx0;
  #2 In = 7'b00001x1;
  #2 In = 7'b00000x1;
  #2 In = 7'b00011x1;
  #2 In = 7'b00010x1;
  #2 In = 7'b0010xx1;
  #2 In = 7'b0011xx1;
  #2 In = 7'b0100xx1;
  #2 In = 7'b0101xx1;
  #2 In = 7'b0110xx1;
  #2 In = 7'b0111xx1;
  #2 In = 7'b1000x11;
  #2 In = 7'b1000x01;
  #2 In = 7'b1001x11;
  #2 In = 7'b1001x01;
  #2 In = 7'b1010xx1;
  #2 In = 7'b1011xx1;
  #2 In = 7'b1100xx1;
  #2 In = 7'b1101xx1;
  #2 In = 7'b1110xx1;
  #2 enable = 0; In = 7'b1110xx1;
  #2 enable = 1; In = 7'b1101011;
  #2 In = 7'b11x1x01;
  #2 In = 7'b1xx1xx1;
  #2 In = 7'b1x10xx1;
  #2 In = 7'b10x10x1;
  #2 In = 7'bxx10xx1;
  #2 In = 7'b0000xx1;

end
initial begin
  $dumpfile("TROM_tb.vcd");
  $dumpvars(0, testbench);
end
endmodule
