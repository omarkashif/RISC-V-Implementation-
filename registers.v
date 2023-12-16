module registers(rd_add1,rd_add2,wr_add,wr_en,wr_data,rd_data1,rd_data2,clk,rst,memtoreg,meminp);
input [4:0] rd_add1,rd_add2,wr_add;
input [31:0] wr_data;
input [31:0] meminp;
input memtoreg;
input wr_en,clk,rst;
output reg [31:0]rd_data1, rd_data2;
integer i;
reg [31:0]regfile[31:0];


reg [31:0]writevalue;
always@(posedge clk)
begin
    if(rst)
    begin
        for(i=0;i<32;i = i + 1)
        begin
            regfile[i] = {$random}%120;
        end
    end
    if(memtoreg==1)
        writevalue = meminp;
    else    
        writevalue = wr_data;
    if(wr_en == 1)
        regfile[wr_add] = writevalue;    
    rd_data1 = regfile[rd_add1];
    rd_data2 = regfile[rd_add2];
end
endmodule