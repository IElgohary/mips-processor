/**
* This is the ALU implementation from the lab 
* and it is not complete
*/

module alu(out, zeroFlag, in1, in2, aluOP);

    input[31: 0] In1, in2;
    input[3: 0] aluOP;
    output reg[31: 0] out;
    output reg zeroFlag;
    always @(in1, in2, aluOP) begin
    if (in1 == in2) zeroFlag = 1;
    else zeroFlag = 0;
    end always @(in1, in2, aluOP)
    begin
        case (aluOP) 
        0: out = in1 
        1: out = in1 
        2: out = in1 
        3: out = in1 
        4: out = in1 
        5: out = in1 
        endcase 
    end 
endmodule