
module fetch_test;

reg clk, pcSrc;
reg [31:0] pc_branched;
wire [31:0] instruction, pc_out;

fetch f(instruction, pc_out, pcSrc, clk, pc_branched);

initial begin
    clk= 0;
    forever begin
        #5 clk = ~clk;
    end
end

initial begin
    $dumpfile("tests/simulation/fetch_test.vcd");    
    $dumpvars(0, f);
    $monitor("clk: %b, instruction: %h, pc_out: %d, pc_branched: %d, pcSrc: %b", clk, instruction, pc_out, pc_branched, pcSrc);
end

initial fork
    #0 begin pcSrc <= 1;pc_branched = 0;end 
    #5 begin pcSrc <= 0; end
    #45 begin  pcSrc <= 1; pc_branched = 8; end
    #55 begin pcSrc <= 0; end
join


initial
    #75 $finish;

endmodule