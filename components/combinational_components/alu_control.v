module alu_control(funct, AluOp, outp);
    input [5:0] funct;
    input [1:0] AluOp;
    output [3:0] outp;
    reg [3:0] outp;
    always @(funct or AluOp or outp)
    begin
        case (AluOp)
        2'b00: outp = 4'b0010 ;//Lw, sw
        2'b01: outp = 4'b0110 ;// beq
        2'b10 : if (funct ==  6'b100000) begin // Add
                    outp=4'b0010 ;
                end
            else if ( funct== 6'b100010) begin // Subtract
                    outp=4'b0110 ;
                end
            else if ( funct==6'b100100) begin // And
                    outp=4'b0000;
                end
            else if( funct== 6'b100101) begin // OR
                    outp=4'b0001;
               end
            else  if( funct==6'b101010) begin // SLT
                 outp=4'b0111;  
                end
          else   if( funct==6'b 000000) begin    // Shift left 
                 outp= 4'b 1111;// shift left 
               end
         else if ( funct==6'b 000010) begin // shift right
                outp= 4'b 1110; // shift right
                end
         2'b11: outp = 4'b1011 ;   // bne
               
        default: outp = 0;
        endcase
    end
endmodule
