//Main decoder

module main_dec(opcode,memtoreg,memwrite,branch,alusrc,regdst,regwrite,aluop,jump);
input[5:0]opcode;
output memtoreg,memwrite,alusrc,branch,regdst,regwrite,jump;
output[1:0]aluop;

reg[8:0]controls;
assign {regwrite,regdst,alusrc,branch,memwrite,memtoreg,aluop,jump}=controls;

always @(*)
begin
case(opcode)
6'b000000 : controls=9'b110000100; //R-type
6'b100011 : controls=9'b101001000; //lw
6'b101011 : controls=9'b001010000; //sw
6'b000100 : controls=9'b000100010; //beq
6'b001000 : controls=9'b101000000; //addi
6'b000010 : controls=9'b000000001; // j
default :controls=9'bxxxxxxxxx;//illegal 
endcase
end
endmodule
