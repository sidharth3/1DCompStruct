/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     PIXEL_COUNT = 10
*/
module display_12 (
    input clk,
    input rst,
    input [95:0] color,
    output reg [3:0] pixel,
    output reg led,
    input update
  );
  
  localparam PIXEL_COUNT = 4'ha;
  
  
  localparam SEND_PIXEL_state = 1'd0;
  localparam RESET_state = 1'd1;
  
  reg M_state_d, M_state_q = SEND_PIXEL_state;
  reg [3:0] M_pixel_ctr_d, M_pixel_ctr_q = 1'h0;
  reg [4:0] M_bit_ctr_d, M_bit_ctr_q = 1'h0;
  reg [5:0] M_ctr_d, M_ctr_q = 1'h0;
  reg [11:0] M_rst_ctr_d, M_rst_ctr_q = 1'h0;
  
  reg [23:0] bits;
  
  always @* begin
    M_state_d = M_state_q;
    M_pixel_ctr_d = M_pixel_ctr_q;
    M_rst_ctr_d = M_rst_ctr_q;
    M_bit_ctr_d = M_bit_ctr_q;
    M_ctr_d = M_ctr_q;
    
    led = 1'h0;
    bits = color[(M_pixel_ctr_q)*24+23-:24];
    pixel = M_pixel_ctr_q;
    
    case (M_state_q)
      SEND_PIXEL_state: begin
        if (bits[(M_bit_ctr_q)*1+0-:1]) begin
          led = M_ctr_q < 6'h2d;
        end else begin
          led = M_ctr_q < 5'h11;
        end
        M_ctr_d = M_ctr_q + 1'h1;
        if (M_ctr_q == 6'h3e) begin
          M_ctr_d = 1'h0;
          M_bit_ctr_d = M_bit_ctr_q + 1'h1;
          if (M_bit_ctr_q == 5'h17) begin
            M_bit_ctr_d = 1'h0;
            M_pixel_ctr_d = M_pixel_ctr_q + 1'h1;
            if (M_pixel_ctr_q == 5'h09) begin
              M_pixel_ctr_d = 1'h0;
              M_state_d = RESET_state;
            end
          end
        end
      end
      RESET_state: begin
        if ((&M_rst_ctr_q)) begin
          if (update) begin
            M_rst_ctr_d = 1'h0;
            M_state_d = SEND_PIXEL_state;
          end
        end else begin
          M_rst_ctr_d = M_rst_ctr_q + 1'h1;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_pixel_ctr_q <= 1'h0;
      M_bit_ctr_q <= 1'h0;
      M_ctr_q <= 1'h0;
      M_rst_ctr_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_pixel_ctr_q <= M_pixel_ctr_d;
      M_bit_ctr_q <= M_bit_ctr_d;
      M_ctr_q <= M_ctr_d;
      M_rst_ctr_q <= M_rst_ctr_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule
