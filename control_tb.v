`include "control.v"

module control_tb;
reg [6:0]insn;
wire branch,memread,memtoreg,memwrite,alusrc,regwrite,jalnk,jalnr;
wire [1:0]aluop;

control uut(insn,branch,memread,memtoreg,aluop,memwrite,alusrc,regwrite,jalnk,jalnr);

initial
begin
    $dumpfile("control.vcd");
    $dumpvars(0,control_tb);
    insn =  7'b1100110; #5    
    insn =  7'b1100000; #5 
    insn =  7'b1100010; #5 
    insn =  7'b1100011; #5 
    insn =  7'b0010011; #5 
    insn =  7'b1101111; #5 
    insn =  7'b1100111; #5 
    insn =  7'b0110011; #5
    $finish;
end



endmodule