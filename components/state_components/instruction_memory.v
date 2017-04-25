module instruction_memory(clk, readAddress, instruction);
input clk;
input [31:0] readAddress;

output reg [31:0] instruction;

reg [7:0]memory [1023:0] ;

initial begin
	{memory[0],memory[1],memory[2],memory[3]} = 'h2149FF00;
	{memory[4],memory[5],memory[6],memory[7]}= 'h2149FF04;
	{memory[8],memory[9],memory[10],memory[11]} = 'h014B4808;
	{memory[12],memory[13],memory[14],memory[15]} = 'h014B4812; 
	{memory[16],memory[17],memory[18],memory[19]} = 'h014B4816; //add t1 t2 t3
	{memory[48],memory[49],memory[50],memory[51]} = 'h2149FF48; // addi t1 t2 0xffff
end

always @(posedge clk)
begin
	instruction <= {memory[readAddress[9:0]], memory[readAddress[9:0]+1], memory[readAddress[9:0]+2], memory[readAddress[9:0]+3]};
end

endmodule