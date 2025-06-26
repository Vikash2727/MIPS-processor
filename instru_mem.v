//Instruction memory

module instru_mem(a,rd);
input[31:0]a;  //a is pc_out(address for the instruction)
output [31:0]rd; //rd is the output

reg[31:0] in_mem[31:0];
 initial
begin
  


in_mem[0]=32'b000000_01000_01001_11111_00000_100000; //r_type add
in_mem[1]=32'b000000_01011_01010_11111_00000_100000; //r_type add

in_mem[2]=32'b000000_01010_01001_11111_00000_100010; //r_type sub

in_mem[3]=32'b000000_01111_01001_11111_00000_100100; //r_type and
in_mem[4]=32'b000000_00111_01101_11111_00000_100101; //r_type or
in_mem[5]=32'b000000_01100_00011_11111_00000_101010; //r_type slt(set less than)
in_mem[6]=32'b100011_01001_11001_00000_00000_001111; //lw-I type
in_mem[7]=32'b101011_00000_00101_00000_10011_111111; //sw store word
in_mem[8]=32'b000100_00101_01001_00000_00000_100000; // branch beq
in_mem[9]=32'b001000_10011_01000_11111_00010_100001; //add i
in_mem[10]=32'b000010_11011_00001_11111_00010_100101; //j- type

end
assign rd=in_mem[a];

endmodule


