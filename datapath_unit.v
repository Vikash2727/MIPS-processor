 //Datapath unit includes all components like muxes,prog_counter,alu etc

`include"alusrc_mux.v"
`include"prog_counter.v"
`include"mux_jump.v"
`include"shiftleft_jump.v"
`include"regfile.v"
`include"shift_left.v"
`include"signextd.v"
`include"mux_pc.v"
`include"mux_writereg.v"
`include"mux_result.v"
`include"adder_branch.v"
`include"adder_pcplus1.v"
`include"alu.v"

module datapath_unit(clk,rst,rd,memtoreg,pcsrc,alusrc,regdst,regwrite,alucontrol,rd_data,zero,alu_result,wd,pc_out,jump);
input clk,rst;
input[31:0]rd;
input memtoreg,pcsrc,alusrc,regdst,regwrite,jump;
input[2:0]alucontrol;
input[31:0]rd_data;
output[31:0]pc_out;
output zero;
output[31:0]alu_result;
output[31:0]wd;

 wire b;
wire[31:0]pcplus1,pc_branch,pc_next1,pc_next2,pc_jump;
wire[4:0]writereg;
wire[31:0]signimm,signimm_shift;
wire[31:0]src_a,src_b;
wire[31:0]result;
prog_counter pcr(.clk(clk), .rst(rst), .pc_next2(pc_next2), .pc_out(pc_out));
regfile rf(.clk(clk), .a1(rd[25:21]), .a2(rd[20:16]), .a3(writereg), .wd3(result), .we3(regwrite), .rd1(src_a), .rd2(wd) );
signextd se(.p_instr(rd[15:0]), .signimm(signimm));

shift_left sl(.signimm(signimm), .signimm_shift(signimm_shift));
adder_pcplus1 add_pcplus(.pc_out(pc_out), .b(b), .pcplus1(pcplus1));
adder_branch add_pcbranch(.signimm_shift(signimm_shift), .pcplus1(pcplus1), .pc_branch(pc_branch)); 
 mux_pc mux1(.pcsrc(pcsrc), .pcplus1(pcplus1), .pc_branch(pc_branch), .pc_next1(pc_next1));
mux_jump mux5(.jump(jump), .pc_next1(pc_next1), .pc_jump(pc_jump), .pc_next2(pc_next2));
shiftleft_jump sl2(.pc_jump(pc_jump), .p(pcplus1[31:28]), .q(rd[25:0]));
mux_writereg mux2(.regdst(regdst), .a(rd[20:16]), .b(rd[15:11]), .writereg(writereg));
alusrc_mux  mux3(.alusrc(alusrc), .rd2(wd), .signimm(signimm), .src_b(src_b));
mux_result mux4(.alu_result(alu_result), .rd_data(rd_data), .memtoreg(memtoreg), .result(result));
alu arith(.alucontrol(alucontrol), .src_a(src_a), .src_b(src_b), .alu_result(alu_result), .zero(zero));

endmodule


