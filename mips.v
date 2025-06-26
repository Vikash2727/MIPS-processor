//MIPS TOP

`include"controller.v"
`include"datapath_unit.v"
`include"data_mem.v"
`include"instru_mem.v"

module mips (clk,rst);
input clk,rst;

 wire[31:0]rd,rd_data,alu_result,pc_out,wd;
wire[2:0]alucontrol;
wire zero,memtoreg,memwrite,pcsrc,alusrc,regdst,regwrite,jump,branch;

controller control_unit(.opcode(rd[31:26]), .func(rd[5:0]), .zero(zero), .memtoreg(memtoreg), .memwrite(memwrite), .pcsrc(pcsrc), .alusrc(alusrc), .regdst(regdst), .regwrite(regwrite), .alucontrol(alucontrol), .jump(jump), .branch(branch));

datapath_unit data(.clk(clk), .rst(rst), .rd(rd), .memtoreg(memtoreg), .pcsrc(pcsrc), .alusrc(alusrc), .regdst(regdst), .regwrite(regwrite), .alucontrol(alucontrol), .rd_data(rd_data), .zero(zero), .alu_result(alu_result), .wd(wd), .pc_out(pc_out),.jump(jump));
 
instru_mem  i_mem(.a(pc_out), .rd(rd));
data_mem    d_mem(.clk(clk), .we(memwrite), .alu_result(alu_result), .wd(wd), .rd_data(rd_data)  );
endmodule
