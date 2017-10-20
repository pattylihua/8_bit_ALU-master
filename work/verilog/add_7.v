/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module add_7 (
    input [2:0] alufn,
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] out,
    output reg z,
    output reg n,
    output reg v
  );
  
  
  
  reg [7:0] result;
  
  reg [7:0] xb;
  
  always @* begin
    xb = b ^ {4'h8{alufn[0+0-:1]}};
    
    case (alufn[0+1-:2])
      3'h0: begin
        result = a + b;
      end
      3'h1: begin
        result = a - b;
      end
      3'h2: begin
        result = a * b;
      end
      3'h3: begin
        result = -a;
      end
      3'h4: begin
        if (a[7+0-:1] == 1'h1) begin
          result = -a;
        end else begin
          result = a;
        end
      end
      default: begin
        result = a - b;
      end
    endcase
    v = (a[7+0-:1] & xb[7+0-:1] & ~result[7+0-:1]) | (~a[7+0-:1] & ~xb[7+0-:1] & result[7+0-:1]);
    n = result[7+0-:1];
    z = (~|result);
    out = result;
  end
endmodule