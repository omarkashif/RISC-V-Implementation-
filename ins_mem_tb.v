`include "ins_mem.v"

module ins_mem_tb;
    reg [31:0]add;
    reg rst;
    wire [31:0]ins_out;

    ins_mem uut(ins_out,add,rst);
    initial 
    begin
       $dumpfile("ins_mem.vcd");
       $dumpvars(0,ins_mem_tb); 
       rst = 1; #2
       rst = 0;
       add = 0 ; #5
       add = 4 ; #5
       $finish;
    end
endmodule