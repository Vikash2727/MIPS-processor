module shiftleft_jump(p,q,pc_jump);
input [3:0]p;
input[25:0]q;
output[31:0]pc_jump;

assign pc_jump={p , q, 2'b00};
endmodule
