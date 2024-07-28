module stimulus;
  
  
  reg [3:0] a, b;
  reg [2:0] sel;
  wire [4:0] out;
  
  ALU alu(a,b,sel,out);
  
  initial
    begin
      
      {a,b,sel} = 'b0;
      #5 a = 4'b0011; b = 4'b0010;
      #5 sel = 3'b001;
      #5 sel = 3'b010;
      #5 sel = 3'b011;
      #5 sel = 3'b100;
      #5 sel = 3'b101;
      #5 sel = 3'b110;
      #5 sel = 3'b111;
    end
  initial
    begin
      $dumpfile("dump.vcd");
	  $dumpvars;
      #60 $finish;
    end

endmodule


module ALU(
  input [3:0] a,
  input [3:0] b,
  input [2:0] sel,
  output reg [4:0] out
);
  
  
  always @(*) begin
  case (sel)
    3'b000 : out = a;
    3'b001 : out = a+b;
    3'b010 : out = a-b;
    3'b011 : out = a/b;
    3'b100 : out = a%b;
    3'b101 : out = a << 1'b1;
    3'b110 : out = a >> 1'b1;
    3'b111 : out = (a>b) ? 'b1 : 'b0;
    default : out = 'bx;
  endcase
  end
  
endmodule