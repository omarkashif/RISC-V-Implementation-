`include "alu.v"

module alu_tb;
reg [31:0]in1, in2,inimm;
reg alusrc;
reg  [3:0] alucontrol;
wire [31:0] out;
wire zero;

alu uut(alucontrol,in1,in2,inimm,out,zero,alusrc);

initial
begin
    $dumpfile("alu.vcd");
    $dumpvars(0, alu_tb);
    alucontrol = 4'b0000; in1 = 5 ; in2 = 9; inimm = 20; alusrc = 1;#5
    alucontrol = 4'b0001; in1 = 5 ; in2 = 9;inimm = 20; alusrc = 0;#5
    alucontrol = 4'b0010; in1 = 5 ; in2 = 9;inimm = 20;alusrc = 0; #5
    alucontrol = 4'b0110; in1 = 5 ; in2 = 9;inimm = 20;alusrc = 1; #5
    alucontrol = 4'b1000; in1 = 5 ; in2 = 9; inimm = 20;alusrc = 0;#5
    alucontrol = 4'b1000; in1 = 9 ; in2 = 5;inimm = 20; alusrc = 1;#5
    $finish;
end
endmodule
