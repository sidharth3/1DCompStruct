/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip,
    output reg a,
    output reg b,
    output reg c,
    input player2left,
    input player2right,
    input player1left,
    input player1right
  );
  
  
  
  reg rst;
  
  reg button;
  
  localparam COLUMNS = 3'h4;
  
  localparam ROWS = 3'h6;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  localparam IDLE_states = 3'd0;
  localparam GENERATE_states = 3'd1;
  localparam DISPLAY_states = 3'd2;
  localparam CHECK_states = 3'd3;
  localparam SHIFT_states = 3'd4;
  localparam BUFFER_states = 3'd5;
  localparam FAIL_states = 3'd6;
  localparam RESET_states = 3'd7;
  
  reg [2:0] M_states_d, M_states_q = IDLE_states;
  wire [4-1:0] M_temp_pixel;
  wire [1-1:0] M_temp_led;
  reg [1-1:0] M_temp_rst;
  reg [24-1:0] M_temp_color;
  reg [1-1:0] M_temp_update;
  forled_2 temp (
    .clk(clk),
    .rst(M_temp_rst),
    .color(M_temp_color),
    .update(M_temp_update),
    .pixel(M_temp_pixel),
    .led(M_temp_led)
  );
  reg M_reset_d, M_reset_q = 1'h0;
  reg M_start_d, M_start_q = 1'h0;
  reg [23:0] M_led_matrix_temp_d, M_led_matrix_temp_q = 1'h0;
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    a = 1'h1;
    b = 1'h1;
    c = 1'h1;
    M_temp_color = 24'h00dd00;
    M_temp_update = 1'h1;
    c = M_temp_led;
    M_temp_rst = io_dip[0+0+0-:1];
  end
  
  always @(posedge clk) begin
    M_reset_q <= M_reset_d;
    M_start_q <= M_start_d;
    M_led_matrix_temp_q <= M_led_matrix_temp_d;
    M_states_q <= M_states_d;
  end
  
endmodule
