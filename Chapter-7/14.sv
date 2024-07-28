module stimulus;
  
  
  reg [3:0] reg_array [1023:0];
  
  reg_alloc a(reg_array);
  
  initial
    begin
      $dumpfile("dump.vcd");
	  $dumpvars;
      #60 $finish;
    end

endmodule

module reg_alloc(
    output reg [3:0] reg_array [1023:0]
);

    integer i;
    initial begin
        for(i=0;i<1024;i=i+1) begin
            reg_array[i] = 'b0;
        end
    end

endmodule