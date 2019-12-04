/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module car_2 (
    input clk,
    input rst,
    input left,
    input right,
    input [3:0] position,
    output reg [3:0] currentPosition
  );
  
  
  
  reg [3:0] M_carposition_d, M_carposition_q = 1'h0;
  
  always @* begin
    M_carposition_d = M_carposition_q;
    
    if (M_carposition_q == 4'h0) begin
      M_carposition_d = position;
    end
    if (position == 4'h4 && right) begin
      M_carposition_d = 1'h1;
    end
    if (left && position == 4'h1) begin
      M_carposition_d = 7'h64;
    end
    currentPosition = M_carposition_q;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_carposition_q <= 1'h0;
    end else begin
      M_carposition_q <= M_carposition_d;
    end
  end
  
endmodule
