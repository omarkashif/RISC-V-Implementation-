module control(insn,branch,memread,memtoreg,aluop,memwrite,alusrc,regwrite,jalnk,jalnr);
input [6:0]insn;
output reg branch,memread,memtoreg,memwrite,alusrc,regwrite,jalnk,jalnr;
output reg [1:0]aluop;
parameter rformat = 7'b0110011;
parameter lw = 7'b1100000;
parameter sw = 7'b1100010;
parameter beq = 7'b1100011;
parameter addi = 7'b0010011;
parameter jal = 7'b1101111;
parameter jalr = 7'b1100111;
always@(*)
begin
   case(insn)
   rformat:
    begin
        alusrc = 0;
        memtoreg = 0;
        regwrite = 1;
        memread = 0;
        memwrite = 0;
        branch = 0;
        aluop = 2'b10;
        jalnk = 0 ; jalnr = 0;
    end
    lw:
    begin
        alusrc = 1;
        memtoreg = 1;
        regwrite = 1;
        memread = 1;
        memwrite = 0;
        branch = 0;
        aluop = 2'b00;
        jalnk = 0 ; jalnr = 0;
    end
    sw:
    begin
        alusrc = 1;
        memtoreg = 1'bx;
        regwrite = 0;
        memread = 0;
        memwrite = 1;
        branch = 0;
        aluop = 2'b00;
        jalnk = 0 ; jalnr = 0;
    end
    beq:
    begin
        alusrc = 0;
        memtoreg = 1'bx;
        regwrite = 0;
        memread = 0;
        memwrite = 0;
        branch = 1;
        aluop = 2'b01;
        jalnk = 0 ; jalnr = 0;
    end
    addi:
        begin
        alusrc = 1;
        memtoreg = 0;
        regwrite = 1;
        memread = 0;
        memwrite = 0;
        branch = 0;
        aluop = 2'b10;
        jalnk = 0 ; jalnr = 0;
        end
    jal:
        begin
        alusrc = 1'bx;
        memtoreg = 1'bx;
        regwrite = 1;
        memread = 0;
        memwrite = 0;
        branch = 0;
        aluop = 2'bxx;
        jalnk = 1 ; jalnr = 0;
        end
    jalr:
        begin
        alusrc = 0;
        memtoreg = 0;
        regwrite = 1;
        memread = 0;
        memwrite = 0;
        branch = 1;
        aluop = 2'b00;
        jalnk = 0 ; jalnr = 1;
        end
   endcase 
end
endmodule