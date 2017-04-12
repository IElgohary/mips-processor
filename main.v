module main;
  initial 
    begin
      $dumpfile("main.vcd");
      $dumpvars(0, main);
      $display("Hello, World");
      $finish ;
    end
endmodule
