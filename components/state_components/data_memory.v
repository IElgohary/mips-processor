
module data_memory(outData, address, inData, memRead, memWrite, clk);

    input memRead, memWrite, clk;
    input [31:0] inData;
    input [31:0] address;
    output reg [31:0] outData;
    
    reg [31:0] memory[0:255];
    integer i;
    initial 
    begin
        for( i = 0 ; i < 256; i= i + 1)
            memory[i] <= 0;
    end

    
    
    always@(posedge clk && memRead && ~memWrite)
    begin// Read data
        outData <= memory[address[7:0]];
    end

    always@(posedge clk && ~memRead && memWrite)
    begin//Write data
        memory[address[7:0]] <= inData;
    end
        
    
endmodule