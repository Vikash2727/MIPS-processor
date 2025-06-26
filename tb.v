// test_bench

`include "mips.v"  
module tb;
  reg clk, rst;

  // Instantiate the design under test (DUT)
  mips dut(.clk(clk), .rst(rst));

initial 
begin
clk=0;
forever #5 clk=~clk;
end


    initial begin
   rst=1;
@(posedge clk) rst=0;
end

initial begin
#1000;

$finish;
end
      endmodule
