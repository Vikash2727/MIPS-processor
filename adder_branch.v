module adder_branch(pcplus1,signimm_shift,pc_branch);
input[31:0]pcplus1;
input[31:0]signimm_shift;
output reg[31:0]pc_branch;

always @(*)begin
pc_branch=pcplus1+signimm_shift;
end
endmodule
