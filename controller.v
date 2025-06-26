//controller unit consist of main decoder and alu decoder
`include"main_dec.v"
`include"alu_dec.v"
`include"and_gate.v"

module controller(opcode,func,zero,pcsrc,memtoreg,memwrite,alusrc,alucontrol,regdst,regwrite,jump,branch);

input[5:0]opcode,func;
input zero;
output memtoreg,memwrite,pcsrc,alusrc,regdst,regwrite,jump;
output[2:0]alucontrol;
wire[1:0]aluop;
output branch;

main_dec md(.opcode(opcode), .memtoreg(memtoreg), .memwrite(memwrite), .branch(branch), .alusrc(alusrc), .regdst(regdst), .regwrite(regwrite), .aluop(aluop), .jump(jump ));

alu_dec ad(.aluop(aluop), .func(func), .alucontrol(alucontrol));
and_gate a(.branch(branch), .zero(zero), .pcsrc(pcsrc));

endmodule
