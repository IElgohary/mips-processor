/**
* This is the ALU implementation from the lab 
* and it is not complete
*/


module alu(out, zeroFlag, in1, in2, aluControl);

    input[31: 0] in1, in2;
    input[3: 0] aluControl;
    output reg[31: 0] out;
    output reg zeroFlag;
    always @(in1, in2, aluControl)
    begin
        case (aluControl) 
        4'b 0000: out = in1 & in2  ; // and 
        4'b 0001: out = in1 | in2  ;  // or
        4'b 0010: out = in1 + in2  ; // lw sw
        4'b 0110: if (in1 == in2)   begin zeroFlag = 1;
                    end
                else  zeroFlag = 0;   // beq
        4'b 0111: out = (in1 < in2) ? 1 : 0  ; // slt
        4'b 1111: out =  in1 << in2 [10:6];  // Shift left   
        4'b 1110: out = in1 >> in2[10:6];    // shift right
        4'b 1011: if (in1 == in2)   begin zeroFlag = 0;
                    end
                else zeroFlag = 1; // bne
            
        endcase 
    end 
endmodule

