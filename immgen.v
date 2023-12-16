module immgen(instruction,immediate);

input [31:0] instruction;
output reg [31:0] immediate;

  wire [6:0] opcode = instruction[6:0];
  wire [2:0] funct3 = instruction[14:12];
  wire [4:0] funct7 = instruction[31:25];
  wire [4:0] rd = instruction[11:7];
  wire [4:0] rs1 = instruction[19:15];

  always @(*) begin
    case (opcode)
      // I-type instructions
      7'b0010011, 7'b0000011, 7'b1100111, 7'b0001111: // addi, lw, jalr, jal
        immediate = { {20{instruction[31]}}, instruction[31:20] };
      // S-type instructions
      7'b0100011: // sw
        immediate = { instruction[31:25], instruction[11:7] };
      // B-type instructions
      7'b1100011: // beq
        immediate = { {19{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0 };
      7'b1101111: // jal
        immediate = { {12{instruction[31]}}, instruction[31], instruction[19:12], instruction[20], instruction[30:21], 1'b0 };
      // R-type instructions
      7'b0110011: // add, and, or, sll, slt, sltu, sra, srl, sub, xor
        case (funct3)
          3'b000: // add, sub
            immediate = 0;
          3'b110: // or
            immediate = 0;
          3'b111: // and
            immediate = 0;
        endcase
      default: // unknown instruction
        immediate = 0;
    endcase
  end

endmodule
