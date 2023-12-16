`include "registers.v"

module registers_tb;
    reg [4:0] rd_add1,rd_add2,wr_add;
    reg [31:0] wr_data;
    reg [31:0] meminp;
    reg memtoreg;
    reg wr_en,clk,rst;
    wire [31:0]rd_data1, rd_data2;

    registers uut(rd_add1,rd_add2,wr_add,wr_en,wr_data,rd_data1,rd_data2,clk,rst,memtoreg,meminp);
    initial
    begin
        $dumpfile("registers.vcd");
        $dumpvars(0,registers_tb);
        clk = 1'b0 ; rst = 1 ; #10
        rst = 0 ; meminp = 50;#20
        wr_en = 1 ; memtoreg =1;#10
        wr_add = 3 ; wr_data = 64 ; #10
        wr_add = 13 ; wr_data = 76; #10

        wr_en = 0; #10
        rd_add1 = 0; rd_add2 = 3 ; #10
        rd_add1 = 13; rd_add2 = 7 ; #10
        rd_add1 = 10; rd_add2 = 21 ; #10
        $finish;
    end
always #5 clk = ~clk;
endmodule

