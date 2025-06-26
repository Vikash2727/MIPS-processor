// The register file has three registers for operations 2-source register and 1-destination register

  module regfile(clk,a1,a2,a3,we3,wd3,rd1,rd2);

input clk,we3;
input[4:0]a1,a2;
input[4:0]a3;

input[31:0]wd3;
output [31:0] rd1,rd2;
 
reg[31:0] reg_mem[31:0]; //register file memory
initial begin

reg_mem[5'b00000]=32'b1111;
reg_mem[5'b00001]=32'b1110;
reg_mem[5'b00010]=32'b1101;
reg_mem[5'b00011]=32'b1100;
reg_mem[5'b00100]=32'b0101;

reg_mem[5'b00101]=32'b1010;
reg_mem[5'b00110]=32'b1001;
reg_mem[5'b00111]=32'b1000;
reg_mem[5'b01000]=32'b0111;
reg_mem[5'b01001]=32'b0110;
reg_mem[5'b01010]=32'b0101;
reg_mem[5'b01011]=32'b0100;
reg_mem[5'b01100]=32'b0011;
reg_mem[5'b01101]=32'b0010;
reg_mem[5'b01110]=32'b0001;
reg_mem[5'b01111]=32'b0000;
reg_mem[5'b10000]=32'b0001;
reg_mem[5'b10001]=32'b0010;
reg_mem[5'b10010]=32'b0011;
reg_mem[5'b10011]=32'b0100;
reg_mem[5'b10100]=32'b0101;
reg_mem[5'b10101]=32'b0110;
reg_mem[5'b10110]=32'b0111;
reg_mem[5'b10111]=32'b1000;
reg_mem[5'b11000]=32'b1001;
reg_mem[5'b11001]=32'b1010;
reg_mem[5'b11010]=32'b1011;
reg_mem[5'b11011]=32'b1100;
reg_mem[5'b11100]=32'b1101;
reg_mem[5'b11101]=32'b1110;
reg_mem[5'b11110]=32'b1111;
reg_mem[5'b11111]=32'b0010;

end
always @(posedge clk)
begin
if(we3==1)         //we3 is connected with regwrite
reg_mem[a3]<=wd3;  //lw instruction
end

assign rd1=(a1!=0)?reg_mem[a1]:0;
assign rd2=(a2!=0)?reg_mem[a2]:0;
endmodule






