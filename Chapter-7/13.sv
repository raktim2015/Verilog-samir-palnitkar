module stimulus;
  
  
  wire clk;
  
  clkgen ck(clk);
  
  
  initial
    begin
      $dumpfile("dump.vcd");
	  $dumpvars;
      #60 $finish;
    end

endmodule

module clkgen(
  output reg clk
);
  
  initial
    clk = 1'b0;
  
  always
    begin
      while(1'b1) begin
        #5 clk = ~clk;
      end
    end
  
  
endmodule