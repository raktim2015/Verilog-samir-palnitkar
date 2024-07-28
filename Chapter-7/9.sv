module stimulus;

  wire clk;
  reg D,Q;
  clkmod c(clk);
  levelSensentiveLatch lv(clk, D, Q);
  
  initial
    begin
      D = 1'b0;
      #5 D = 1'b1;
      #5 D = 1'b0;
      #5 D = 1'b1;
      
    end
  initial
    begin
      $dumpfile("dump.vcd");
	  $dumpvars;
      #40 $finish;
    end

endmodule

module levelSensentiveLatch(
	input clk,
  	input D,
  	output reg Q
);
  
  always @(*)
    begin
      if (clk) Q <= D;
    end
  
endmodule

module clkmod(
  output reg clk
);

  initial
  	clk = 0;
  
  always
    begin
      if(clk == 1'b1)
      	#2 clk = ~clk;
      else if(clk == 1'b0)
        #3 clk = ~clk;
    end
endmodule