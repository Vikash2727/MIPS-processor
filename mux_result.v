// Output mux

module mux_result(alu_result,rd_data,memtoreg,result);
input[31:0]alu_result,rd_data;
input memtoreg;
output [31:0]result;

assign result=(memtoreg) ? rd_data : alu_result;
endmodule


