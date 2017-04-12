module data_memory(outData, address, inData, memRead, memWrite, clk);

    input memRead, memWrite, clk;
    input [31:0] inData, address;
    output reg [31:0] outData;
    
    reg [31:0] memory[0:255];
    integer i;
    initial 
    begin
        for( i = 0 ; i < 256; i= i + 1)
            memory[i] <= 0;
    end

    
    
    always@(posedge clk)
    begin
        if(memRead) //Read data from memory
        begin
            outData <= memory[address];
        end
        else if(memWrite) //Write data to memory
        begin
            memory[address] <= inData;
        end
    end
    
endmodule