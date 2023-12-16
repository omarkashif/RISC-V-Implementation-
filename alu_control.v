module alu_control(opcode,f3,f7,alucontrol);
input [6:0] opcode;
input [2:0] f3;
input [6:0] f7;
output reg [3:0]alucontrol;
always@(*)
begin
    case({opcode,f3,f7})
    17'b01100110000000000: alucontrol = 4'b0010;
    17'b01100110000100000: alucontrol = 4'b0110;
    17'b01100111100000000: alucontrol = 4'b0001;
    17'b01100111110000000: alucontrol = 4'b0000;
    17'b1100111000xxxxxxx: alucontrol = 4'b1000;
    endcase
end
endmodule