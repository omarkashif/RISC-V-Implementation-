module data_mem(address,wr_en,read_en,data_out,wr_data,rst);
input [31:0]address,wr_data;
input wr_en,read_en,rst;
output reg [31:0]data_out;
reg [31:0]mem[255:0];
integer i;
always@(*)
begin
    if(rst==1)
    begin
        for (i = 0 ; i<256 ;i = i + 1) 
        begin
            mem[i] = {$random}%500;   
        end 
    end
    if(read_en==1)
        data_out = mem[address];
    if(wr_en==1)
        mem[address] = wr_data;
end
endmodule