//regdst mux control two signal by regdst signal

module mux_writereg(a,b,regdst,writereg);

input[4:0]a,b;
input regdst;
output[4:0]writereg;
 assign writereg=(regdst) ? a : b;
endmodule

