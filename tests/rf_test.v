include "../state_components/register.v"

module Test

reg clk;
reg [4:0] rs, rt, rd;
reg [31:0] writeData;
reg writeData;
wire [31:0] readData1, readData2;

register_file rf(clk, rs, rt, rd, regWrite, writeData, readData1, readData2);

initial begin
    clk= 0;
    forever begin
        #5 clk = ~clk;
    end
end

initial begin
    $monitor("clk: %b,readData1: %d, readData2: %d", clk, readData1, readData2);
    #5 rs <= 2'b00;
    #5 rd <= 2'b01;
    #5 writeData <= 32'd9;
    #5 regWrite <= 1;
    #15 regWrite <= 0;
    #5 rt <= 2'b01;
end

initial
#60 $finish
endmodule    