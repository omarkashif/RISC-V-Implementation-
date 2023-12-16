`include "ins_mem.v"
`include "registers.v"
`include "alu.v"
`include "data_mem.v"
`include "immgen.v"
`include "control.v"
`include "pc.v"
`include "alu_control.v"


module processor (clk,rst,add,outp,d1,d2,test,instruction,immediate_num,data_mem_out,pc_output,alu_control_out,alu_output);
wire [31:0]insn;
input clk,rst;
output reg [4:0]test;
input [31:0]add;
output reg [31:0]outp,d1,d2;

wire [31:0]out;
wire branch, memread, memtoreg, memwrite, alusrc, regwrite,jalnk,jalnr;
wire [1:0] aluop;
wire [31:0] rd_dat1, rd_dat2;
wire [3:0]alucontrol;
wire [31:0]aluout,memory_out;
wire [31:0]immed;
wire zero;

output reg [31:0]instruction;
output reg [31:0]immediate_num;
output reg [31:0]data_mem_out;
output reg [31:0]pc_output;
output reg [3:0]alu_control_out;
output reg [31:0]alu_output;


ins_mem insmem(.ins_out(insn),.add(add),.rst(rst));

immgen imgen(.instruction(insn),.immediate(immed));

control cont(.insn(insn[6:0]),.branch(branch),.memread(memread),.memtoreg(memtoreg),.aluop(aluop),.memwrite(memwrite),.alusrc(alusrc),.regwrite(regwrite),.jalnk(jalnk),.jalnr(jalnr));

alu_control aluc(.opcode(insn[6:0]),.f3(insn[14:12]),.f7(insn[31:25]),.alucontrol(alucontrol));


data_mem datmem(.address(aluout),.wr_en(memwrite),.read_en(memread),.data_out(memory_out),.wr_data(rd_dat2),.rst(rst));


pc prog_count(.clk(clk),.insn(out),.branch(branch),.label(insn[31:19]),.rst(rst),.jump(jump),.zero(zero));

registers regist(.rd_add1(insn[19:15]),.rd_add2(insn[24:20]),.wr_add(insn[11:7]),.wr_en(regwrite),.wr_data(aluout),.rd_data1(rd_dat1),.rd_data2(rd_dat2),.clk(clk),.rst(rst),.memtoreg(memtoreg),.meminp(memory_out));

alu aluu(.alucontrol(alucontrol),.in1(rd_dat1),.in2(rd_dat2),.inimm(immed),.out(aluout),.zero(zero),.alusrc(alusrc));
always @(*) begin

    instruction = insn;

    immediate_num = immed;

    data_mem_out = memory_out;

    pc_output = out;

    outp = aluop;

    alu_control_out = alucontrol;

    alu_output = aluout;

    d1 = rd_dat2;
    d2 = rd_dat1;

    test = insn[19:15];
end

    
endmodule