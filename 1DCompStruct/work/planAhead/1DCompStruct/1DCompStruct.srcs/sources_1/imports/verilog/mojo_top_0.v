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
  
  
  
  reg mySig;
  
  reg rst;
  
  reg button;
  
  localparam COLUMNS = 3'h4;
  
  localparam ROWS = 3'h6;
  
  localparam T1 = 10'h203;
  
  localparam T2 = 10'h203;
  
  localparam T3 = 10'h201;
  
  localparam T4 = 10'h200;
  
  wire [8-1:0] M_clrm_cc1;
  wire [8-1:0] M_clrm_cc2;
  reg [1-1:0] M_clrm_rst;
  reg [10-1:0] M_clrm_lane1;
  reg [10-1:0] M_clrm_lane2;
  reg [10-1:0] M_clrm_lane3;
  reg [10-1:0] M_clrm_lane4;
  color_map_1 clrm (
    .clk(clk),
    .rst(M_clrm_rst),
    .lane1(M_clrm_lane1),
    .lane2(M_clrm_lane2),
    .lane3(M_clrm_lane3),
    .lane4(M_clrm_lane4),
    .cc1(M_clrm_cc1),
    .cc2(M_clrm_cc2)
  );
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_2 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  localparam IDLE_states = 3'd0;
  localparam SHIFT_states = 3'd1;
  localparam CHECKINPUT_states = 3'd2;
  localparam CHECKCOLLISION_states = 3'd3;
  localparam GENERATE_states = 3'd4;
  localparam FAIL_states = 3'd5;
  
  reg [2:0] M_states_d, M_states_q = IDLE_states;
  reg M_start_d, M_start_q = 1'h0;
  
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
    b = 1'h0;
    c = 1'h0;
    M_clrm_lane4 = 10'h200;
    M_clrm_lane3 = 10'h201;
    M_clrm_lane2 = 10'h203;
    M_clrm_lane1 = 10'h203;
    M_clrm_rst = rst;
    io_led[0+7-:8] = M_clrm_cc1;
    io_led[8+7-:8] = M_clrm_cc2;
  end
  
  always @(posedge clk) begin
    M_start_q <= M_start_d;
    M_states_q <= M_states_d;
  end
  
endmodule
