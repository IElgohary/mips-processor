
module Test;

reg clk;
reg [4:0] rs, rt, rd;
reg [31:0] writeData;
reg regWrite;
wire [31:0] readData1, readData2;

register_file rf(clk, rs, rt, rd, regWrite, writeData, readData1, readData2);

initial begin
    clk= 0;
    forever begin
        #5 clk = ~clk;
    end
end

initial begin
    $dumpfile("tests/simulation/im_test.vcd");    
    $dumpvars(0, rf);
    $monitor("clk: %b, readData1: %d, readData2: %d", clk, readData1, readData2);
end

initial fork
    #5 begin 
        rd <= 1;
        writeData <= 9;
        regWrite <= 1;
        end
    #15 begin 
        regWrite <= 0; 
        rs <= 1;
        end
    #25 begin 
        regWrite <= 0; 
        rs <= 0;
        rt <= 1;
        end
join

initial
#25 $finish;

endmodule    