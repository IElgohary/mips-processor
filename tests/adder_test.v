
module adder_test;

reg [31:0] in1, in2;
wire [31:0] out;

adder add(out, in1, in2);

initial begin
    $dumpfile("tests/simulation/adder_test.vcd");    
    $dumpvars(0, add);
    $monitor("out: %b, in1: %b, in2: %b", out, in1, in2);
end

initial fork
    #5 begin in1 <= 5 ;in2 <= 3;end
    #15 begin in1 <= 300 ;in2 <= 40;end
join


initial
    #15 $finish;

endmodule