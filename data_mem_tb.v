`include "data_mem.v"

module data_mem_tb;
reg [31:0]address,wr_data;
reg wr_en,read_en,rst;
wire [31:0]data_out;

data_mem uut(address,wr_en,read_en,data_out,wr_data,rst);
initial
begin
    $dumpfile("data_mem.vcd");
    $dumpvars(0, data_mem_tb);
    rst = 1; #5
    rst = 0; read_en = 1 ; address = 32 ; #5
    address = 90 ; #5
    address = 127; #5
    address = 10 ; #5
    address = 17; #5
    address = 9 ; #5
    address = 255; #5
    wr_en = 1; read_en = 0 ; wr_data = 66; address = 90; #5
    wr_data = -98; address = 51; #5
    read_en = 1 ;wr_en = 0; address = 51; #5
    address = 90; #5
    $finish;

end
endmodule