/**
* This is the ALU implementation from the lab 
* and it is not complete
*/

module alu(out, zeroFlag, in1, in2, aluControl);

    input[31: 0] In1, in2;
    input[3: 0] aluControl;
    output reg[31: 0] out;
    output reg zeroFlag;
    always @(in1, in2, aluControl) begin
    if (in1 == in2) zeroFlag = 1;
    else zeroFlag = 0;
    end always @(in1, in2, aluControl)
    begin
        case (aluControl) 
        4b'0000: out = in1 & in2
        4b'0001: out = in1 | in2    
        4b'0010: out = in1 + in2
        4b'0110: out = in1 - in2
        4b'0111: out = (in1 < in2) ? 1 : 0 
        4b'1100: out = ~ ( in1 | in2 )
            
            
        endcase 
    end 
endmodule
