 //shift left 2 mean multiplying signimm by 4

module shift_left(signimm,signimm_shift);
input[31:0]signimm;
output[31:0]signimm_shift;

assign signimm_shift={signimm[29:0] , 2'b00};
endmodule

