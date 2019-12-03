/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module color_map_1 (
    input clk,
    input rst,
    input [9:0] lane1,
    input [9:0] lane2,
    input [9:0] lane3,
    input [9:0] lane4,
    output reg [7:0] cc1,
    output reg [7:0] cc2
  );
  
  
  
  reg [1:0] temp_r0;
  
  reg [1:0] temp_r1;
  
  reg [1:0] temp_r2;
  
  reg [1:0] temp_r3;
  
  reg [23:0] color_cell0;
  
  reg [23:0] color_cell1;
  
  reg [23:0] color_cell2;
  
  reg [23:0] color_cell3;
  
  always @* begin
    color_cell0 = 24'h000000;
    color_cell1 = 24'h000000;
    color_cell2 = 24'h000000;
    color_cell3 = 24'h000000;
    temp_r0 = lane1[0+1-:2];
    temp_r1 = lane2[0+1-:2];
    temp_r2 = lane3[0+1-:2];
    temp_r3 = lane4[0+1-:2];
    if (temp_r0 == 2'h0) begin
      color_cell0 = 24'h000000;
      cc1 = color_cell0[0+7-:8];
    end
    if (temp_r0 == 2'h1) begin
      color_cell0 = 24'h010000;
      cc1 = color_cell0[0+7-:8];
    end
    if (temp_r0 == 2'h3) begin
      color_cell0 = 24'h0000ff;
      cc1 = color_cell0[0+7-:8];
    end
    cc1 = lane1;
    cc2 = color_cell0[0+7-:8];
  end
endmodule
