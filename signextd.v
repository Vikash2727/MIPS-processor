//sign extend is use here to extend 16bits to 32bits

module signextd(p_instr,signimm);
input [15:0]p_instr;
output[31:0]signimm;

assign signimm={{16{p_instr[15]}},p_instr[15:0]};
endmodule
