module Test;

reg clk;
reg [31:0] readAddress;
wire [31:0] instruction;

instruction_memory im(clk, readAddress, instruction);

initial begin
    clk= 0;
    forever begin
        #5 clk = ~clk;
    end
end

initial begin
    $dumpfile("tests/simulation/im_test.vcd");    
    $dumpvars(0, im);
    $monitor("clk: %b,readAddress: %b, instruction: %b", clk, readAddress, instruction);
end
initial fork
    #5 readAddress <= 10; 
    #15 readAddress <= 105;
join

initial
#30 $finish;
endmodule    