module stimulus;
  
  reg clk;
  Register d1(clk);
  initial
    begin
      $dumpfile("dump.vcd");
	  $dumpvars;
      #100 $finish;
    end

endmodule

module Register(
  output reg oscillate
);

  initial
  	oscillate = 0;
  
  always
    begin
      if(oscillate == 1'b1)
      	#10 oscillate = ~oscillate;
      else if(oscillate == 1'b0)
        #30 oscillate = ~oscillate;
    end
  
  
endmodule
    
