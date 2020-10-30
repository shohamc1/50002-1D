/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module multiplier_1 (
    input [15:0] a,
    input [15:0] b,
    input [7:0] io_dip,
    output reg [15:0] out
  );
  
  
  
  always @* begin
    out = 1'h0;
    
    case (io_dip[0+7-:8])
      2'h2: begin
        out = a * b;
      end
      2'h3: begin
        out = a / b;
      end
    endcase
  end
endmodule
