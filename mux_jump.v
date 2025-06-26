module mux_jump(pc_next2,pc_jump,jump,pc_next1);
input[31:0]pc_next1;
input[31:0]pc_jump;
input jump;
output[31:0]pc_next2;

assign pc_next2=jump ? pc_jump:pc_next1;
endmodule
