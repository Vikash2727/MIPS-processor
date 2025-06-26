 //data memory

module data_mem(alu_result,wd,we,clk,rd_data);
input[31:0]alu_result,wd;
input clk,we;
output reg[31:0]rd_data;

reg[31:0] data_mem[31:0];

always @(posedge clk)
begin 
if(we==1)begin
data_mem[alu_result]<=wd;
end
else if(we==0)
begin
rd_data<=data_mem[alu_result];
end
end
 
endmodule 
