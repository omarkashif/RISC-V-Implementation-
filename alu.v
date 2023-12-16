module alu(alucontrol,in1,in2,inimm,out,zero,alusrc);
input [31:0]in1, in2,inimm;
input alusrc;
input  [3:0] alucontrol;
output reg [31:0] out;
output  reg zero;
parameter AND = 4'b0000;
parameter OR = 4'b0001;
parameter ADD = 4'b0010;
parameter SUB = 4'b0110;
parameter COMP = 4'b1000;
reg [31:0] inp2;
always@(*)
begin
if(alusrc==1)
    inp2 = inimm;
else
    inp2 = in2;
case(alucontrol)
AND: out = in1 & inp2;
OR: out = in1 | inp2;
ADD: out = in1 + inp2;
SUB: out = in1 - inp2;
COMP: begin
if(in1<inp2)
    out = 1;
else    
    out = 0;
end
// default: out = 32'bx;
endcase

if(out == 0)
    zero = 1;
else 
    zero = 0;
end
endmodule