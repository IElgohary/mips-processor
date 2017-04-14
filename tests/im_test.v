include "../state_components/instruction_memory.v"

module Test

reg clk;
reg [9:0] readAddress;
wire [31:0] instruction;

instruction_memory im(clk, readAddress, instruction);

initial begin
    clk= 0;
    forever begin
        #5 clk = ~clk;
    end
end

initial begin
    $monitor("clk: %b,readAddress: %b, instruction: %b", clk, readAddress, instruction);
    #5 readAddress <= 10'b0000000000;
    #15 readAddress <= 10'b0000100001;
    #15 readAddress <= 10'b0101010101;
    #15 readAddress <= 10'b0011001100;
end

initial
#60 $finish
endmodule    