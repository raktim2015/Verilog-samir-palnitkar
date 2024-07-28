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

  initial begin
  	oscillate = 0;
  	forever
    	#30 oscillate = ~oscillate;
  	end
  
endmodule
    
