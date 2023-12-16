`include "alu_control.v"

module alu_control_tb;
reg [6:0] opcode;
reg [2:0] f3;
reg [6:0] f7;
wire [3:0]alucontrol;
alu_control uut(opcode,f3,f7,alucontrol);
initial begin
    $dumpfile("alu_control.vcd");
    $dumpvars(0,alu_control_tb);
    {opcode,f3,f7} = 17'b01100110000000000 ;#5
    {opcode,f3,f7} = 17'b01100111100000000 ;#5
    {opcode,f3,f7} = 17'b1100111000xxxxxxx ;#5
    $finish;
end
endmodule