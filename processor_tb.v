`include "processor.v"

module processor_tb;

reg clk,rst;
reg [31:0]add;
wire [31:0]outp,d1,d2;
wire [4:0]test;
wire [31:0]instruction;
wire [31:0]immediate_num;
wire [31:0]data_mem_out;
wire [31:0]pc_output;
wire [3:0]alu_control_out;
wire [31:0]alu_output;
processor uut(clk,rst,add,outp,d1,d2,test,instruction,immediate_num,data_mem_out,pc_output,alu_control_out,alu_output);

initial begin
    $dumpfile("processor.vcd");
    $dumpvars(0,processor_tb);
    clk = 0; #2
    rst = 1; #10
    rst = 0;
    add = 0; #400
    // add = 12; #5
    // // add = 6; #5
    // // rst = 1;
    // add = 1; #10
    // add = 0; #10
    // add = 2; #10
    // add = 3; #10
    // add = 4; #10
    // add = 5; #10
    // add = 6; #10
    // add = 9; #100

    $finish;
end

always #2 clk = ~clk;
endmodule