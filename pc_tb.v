`include "pc.v"

module pc_tb;
    reg clk,branch,jump,zero,rst;
    reg [12:0]label;
    wire [31:0]insn;

    pc uut(clk,insn,branch,label,rst,jump,zero);

    initial
    begin
        $dumpfile("pc.vcd");
        $dumpvars(0, pc_tb);
        clk = 0 ; rst = 1 ;#10
        rst = 0 ; #20
        branch = 0 ; #5
        jump= 1; #5
        branch = 0 ; #5
        branch = 1 ; label = 196 ; zero = 1; #5
        branch = 1 ; label = 800 ; zero = 0; #5
        $finish;
    end

    always #5 clk = ~clk;
endmodule