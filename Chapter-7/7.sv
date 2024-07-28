module stimulus;
  wire clk;
  clkmod clkgen(clk);
  
  reg din, clr, Q;
  Dff reg1(clk, din, clr, Q);
  
  initial
    begin
      din = 1'b0; clr = 1'b0;
      #10 din = 1'b0; clr = 1'b1;
      #10 din = 1'b1; clr = 1'b0;
      #10 din = 1'b0;
      #10 din = 1'b1;
      #10 clr = 1'b1;
    end
  
  initial
    begin
      $monitor("din = %b, clr = %b, Q=%b\n", din, clr, Q);
    end
  
  initial
    begin
      $dumpfile("dump.vcd");
	  $dumpvars;
      #200 $finish;
    end
endmodule


module Dff (
  input clk,
  input din,
  input clr,
  output reg Q
);
  
  always @(negedge clk) begin
    if(clr == 1'b1) begin
    	Q <= 1'b0;
    end
    else begin
      	Q <= din;
    end
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