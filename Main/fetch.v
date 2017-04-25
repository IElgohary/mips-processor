module fetch(instruction, pc_out, pcSrc, clk, pc_branched );

// clock, pc source
input wire clk, pcSrc; 
// branched pc
input wire [31:0] pc_branched;

wire [31:0] pcOut_mux, mux_pc;
// pc register
reg [31:0] pc, input_4 ;
output wire [31:0] instruction , pc_out; 


initial begin
  input_4 = 4;
  pc = 0;
end

always@(posedge clk) pc <= mux_pc;

assign pc_out = pcOut_mux;
//  get instruction using address in pc
instruction_memory im(clk, pc, instruction);

// MUX
mux mux(mux_pc,pcOut_mux, pc_branched, pcSrc);

// ADDER 
adder add(pcOut_mux, pc, input_4);

endmodule