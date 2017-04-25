module decode(instr, op, rs, rt, rd, immed);

input [31:0] instr;
output wire [5:0] op;
wire [4:0] rs, rt, rd;
wire [15:0] immed;

assign op = instr[31:26];
assign rs = instr[25:21];
assign rt = instr[20:16];
assign rd = instr[15:11];
assign immed = instr[15:0];

endmodule