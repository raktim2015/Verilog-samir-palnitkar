module stimulus;
  
  
  reg i0, i1, i2, i3, s0, s1, out;
  mux4_to_1 m(out, i0, i1, i2, i3, s1, s0);
  
  
  initial
    begin
      //i0=1'b0; i1=1'b0; i2=1'b0; i3 = 1'b0; s0 = 1'b0; s1 = 1'b0;
      {i0, i1, i2, i3, s0 , s1} = 6'b0;
      #10 {i0, i1, i2, i3, s0 , s1} = 6'b101000;
      #10 {i0, i1, i2, i3, s0 , s1} = 6'b101001;
      #10 {i0, i1, i2, i3, s0 , s1} = 6'b101010;
      #10 {i0, i1, i2, i3, s0 , s1} = 6'b101011;
      #10 {i0, i1, i2, i3, s0 , s1} = 6'b101111;
    end
  
  initial
    begin
      $dumpfile("dump.vcd");
	  $dumpvars;
      #200 $finish;
    end

endmodule

module mux4_to_1 (out, i0, i1, i2, i3, s1, s0);
// Port declarations from the I/O diagram
output out;
input i0, i1, i2, i3;
input s1, s0;
reg out;
  
  always @(i0 or i1 or i2 or i3 or s0 or s1) begin
    if({s1, s0} == 2'b00)
      out = i0;
    else if({s1, s0} == 2'b01)
      out = i1;
    else if({s1,s0} == 2'b10)
      out = i2;
    else if({s1,s0} == 2'b11)
      out = i3;
  end
  
endmodule