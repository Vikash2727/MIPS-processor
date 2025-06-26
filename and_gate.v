//and gate 
module and_gate(branch,zero,pcsrc);
input branch,zero;
output pcsrc;

assign pcsrc=branch & zero;
endmodule
