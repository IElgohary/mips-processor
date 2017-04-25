
module data_memory_test;

reg clk, memRead, memWrite;
reg [31:0] inData;
reg [7:0] address;
wire [31:0] outData;

data_memory dm(outData, address, inData, memRead, memWrite, clk);

initial begin
    clk= 0;
    forever begin
        #5 clk = ~clk;
    end
end

initial begin
    $dumpfile("tests/simulation/dm_test.vcd");    
    $dumpvars(0, dm);
    $monitor("clk: %b, address: %b, inData: %b, outData: %b", clk, address, inData, outData);
end

initial fork
    #5 begin address <= 8'b00000000 ;memRead <= 0; memWrite <= 1;inData <= 10; end
    #15 begin address <= 8'b00000000 ;memRead <= 1; memWrite <= 0; end
    #25 begin address <= 8'b00000001 ;memRead <= 1; memWrite <= 1; end
    #35 begin address <= 8'b00000001 ;memRead <= 1; memWrite <= 0; end
    #45 begin address <= 8'b00000001 ;memRead <= 0; memWrite <= 0; end
join


initial
    #125 $finish;

endmodule