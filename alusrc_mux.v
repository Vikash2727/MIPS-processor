//alu src mux takes signimm and rd2 as inputs and alusrc as selection line

module alusrc_mux(rd2,signimm,alusrc,src_b);
input alusrc;
input[31:0]rd2,signimm;
output [31:0]src_b;

assign src_b=(alusrc) ? signimm : rd2;
endmodule

