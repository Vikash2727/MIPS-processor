//program counter

module prog_counter(clk,rst,pc_next2,pc_out);
input[31:0]pc_next2;
input clk,rst;
output reg[31:0]pc_out;

always @(posedge clk)
begin
if(rst==1)
pc_out<=0;
else

pc_out<=pc_next2;
end
endmodule
