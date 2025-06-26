//32-bits adder 

module adder_pcplus1(pc_out,b,pcplus1);
input[31:0]pc_out;
input b;
output reg[31:0]pcplus1;
assign b=1'b1;
always @(*)
begin
pcplus1=pc_out+b;
end
endmodule
