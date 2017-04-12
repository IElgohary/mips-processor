module mux (out, in1 , in2, sel);
    
    input sel;
    input [31:0] in1,in2;
    output reg [31:0] out;
    
    always@(sel or in1 or in2)
    case (sel)
      0: out <= in1;
      1: out <= in2;
    endcase
    
endmodule