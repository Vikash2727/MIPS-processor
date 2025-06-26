//alu perform arithmetic and logical operation 

module alu(src_a,src_b,alucontrol,alu_result,zero);
input[31:0]src_a,src_b;
input[2:0]alucontrol;
output reg [31:0]alu_result;
output reg zero;

always @(*)
begin

case(alucontrol)  //alucontrol specify which operation has to be perform

	3'b000 :begin
	       	alu_result=src_a & src_b;//add operation
if(alu_result==0) zero=1;
else
	zero=0;
end



3'b001 :begin
	alu_result=src_a | src_b; //or operation
if(alu_result==0) zero=1;
else zero=0;
end

	
 

 3'b010 :begin
	 alu_result=src_a + src_b; //add operation
if(alu_result==0) zero=1;
 else  zero=0;
 end


 3'b110 :begin
	 alu_result=src_a - src_b; //subtraction operation
if(alu_result==0) zero=1;
else zero=0;
end

3'b101 :begin
	 alu_result=src_a * src_b; //multi operation
if(alu_result==0) zero=1;
else zero=0;
end
	

3'b111 :begin
	alu_result= (src_a<src_b)?1:0;
      if(alu_result==0) zero=1;
      else zero=0;
      end
       	
endcase
end
initial begin
zero=(src_a==src_b)?1:0;
end
endmodule
