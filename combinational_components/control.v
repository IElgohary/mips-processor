/** 
*   Not Finished Yet
*/
module control (regDst, jump, branch, memRead, memToReg, aluOp, memWrite, aluSrc, regWrite, opCode);

    input [5:0] opCode;
    output reg regDst, jump, branch, memRead, memToReg, memWrite, aluSrc, regWrite;
    output reg [1:0] aluOp;

    always @(opcode)
    begin
       
        case (opcode)
            'h0://R-Type
                begin
                aluOp = 
                end ;
            'h8: ;//ADDI 
            'h23://LW
                begin
                    
                end ;
            'h2B: ;//SW
            'hC: ;//ANDI
            'hD: ; //ORI
            'h4: ; //BEQ
            'h5: ; //BNE
        endcase
       
    end

endmodule;