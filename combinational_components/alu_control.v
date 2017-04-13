module alu_control(funct, AluOp, a,b outp);
    input [5:0] funct;
    input a,b;
    input [2:0] AluOp;
    output [4:0] outp;
    reg [4:0] outp;
    always @(funct or AluOp or outp)
begin
    
    case (AluOp)
00: outp = 0010 ;
01: outp = 0110 ;
        
10 & funct== 100000: outp =0010 ;
10& funct== 100010: outp= 0110 ;
10 & funct== 100100: outp = 0000;
10& funct ==100101: outp= 0001;
10 & funct==101010: outp=0111;       
default: outp = 0;
    endcase

    
endmodule;
