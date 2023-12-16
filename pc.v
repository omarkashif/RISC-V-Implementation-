module pc(clk,insn,branch,label,rst,jump,zero);
    input clk,branch,jump,zero,rst;
    input [12:0]label;
    output reg[31:0]insn;

    always@(posedge clk)
    begin
        if(rst)
            insn = 0;
        if((branch && zero)||jump)
            insn = insn + label/4;
        else    
            insn = insn + 1; 
    end
endmodule