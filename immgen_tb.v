`include "immgen.v"

module immgen_tb;

reg [31:0] instruction;
wire [31:0] immediate;
immgen uut(instruction,immediate) ;
initial begin
    $dumpfile("immgen.vcd");
    $dumpvars(0,immgen_tb);
    instruction = 32'b00000001010110100000010010110011; #5
    instruction = 32'b00001111000001010010010010000011; #5
    instruction = 32'b00000000100110101000010010110011; #5
    instruction = 32'b00000000000101001000010010010011; #5
    instruction = 32'b00000110100101010010110000100011; #5
    $finish;
end 
endmodule