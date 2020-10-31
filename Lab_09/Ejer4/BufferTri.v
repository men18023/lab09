// Buffer

module BuffTri(
  input wire enable,
  input wire [3:0]In,
  output wire [3:0]Ex);

    assign Ex = (enable) ? In:4'bz;
endmodule
