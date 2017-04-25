module instruction_memory(clk, readAddress, instruction);
input clk;
input [9:0] readAddress;

output reg [31:0] instruction;

reg [1023:0] memory [31:0];

always @(posedge clk)
begin
	instruction <= memory[readAddress];
end

endmodule