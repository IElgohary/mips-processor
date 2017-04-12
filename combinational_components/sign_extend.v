module sign_extend(out, in);

    input [15:0] in;
    output reg [31:0] out;
    integer i;

    always@(in)
    begin
      for(i = 16 ; i < 32 ; i = i+1)
      begin
        out[i] <= in[15];
      end

      out[15:0] <= in;
    end
endmodule