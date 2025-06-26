//This mux is control by pcsrc signal and it control two instruction(pcplus1 and pcbranch)

module mux_pc(pcsrc,pcplus1,pc_branch,pc_next1);
input[31:0]pcplus1,pc_branch;
input pcsrc;
output[31:0]pc_next1;

assign pc_next1=pcsrc ? pc_branch : pcplus1;
endmodule 

