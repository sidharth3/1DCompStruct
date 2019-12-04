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
    output reg row1,
    output reg row2,
    output reg row3,
    output reg row4,
    output reg row5,
    output reg row6,
    input player2leftBtn,
    input player2rightBtn,
    input player1leftBtn,
    input player1rightBtn
  );
  
  
  
  reg rst;
  
  reg player1left;
  
  reg player1right;
  
  reg player2left;
  
  reg player2right;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_player1left_cond_out;
  reg [1-1:0] M_player1left_cond_in;
  button_conditioner_2 player1left_cond (
    .clk(clk),
    .in(M_player1left_cond_in),
    .out(M_player1left_cond_out)
  );
  wire [1-1:0] M_player1right_cond_out;
  reg [1-1:0] M_player1right_cond_in;
  button_conditioner_2 player1right_cond (
    .clk(clk),
    .in(M_player1right_cond_in),
    .out(M_player1right_cond_out)
  );
  wire [1-1:0] M_player2left_cond_out;
  reg [1-1:0] M_player2left_cond_in;
  button_conditioner_2 player2left_cond (
    .clk(clk),
    .in(M_player2left_cond_in),
    .out(M_player2left_cond_out)
  );
  wire [1-1:0] M_player2right_cond_out;
  reg [1-1:0] M_player2right_cond_in;
  button_conditioner_2 player2right_cond (
    .clk(clk),
    .in(M_player2right_cond_in),
    .out(M_player2right_cond_out)
  );
  wire [4-1:0] M_display1_pixel;
  wire [1-1:0] M_display1_led;
  reg [96-1:0] M_display1_color;
  reg [1-1:0] M_display1_update;
  display_6 display1 (
    .clk(clk),
    .rst(rst),
    .color(M_display1_color),
    .update(M_display1_update),
    .pixel(M_display1_pixel),
    .led(M_display1_led)
  );
  wire [4-1:0] M_display2_pixel;
  wire [1-1:0] M_display2_led;
  reg [96-1:0] M_display2_color;
  reg [1-1:0] M_display2_update;
  display_6 display2 (
    .clk(clk),
    .rst(rst),
    .color(M_display2_color),
    .update(M_display2_update),
    .pixel(M_display2_pixel),
    .led(M_display2_led)
  );
  wire [4-1:0] M_display3_pixel;
  wire [1-1:0] M_display3_led;
  reg [96-1:0] M_display3_color;
  reg [1-1:0] M_display3_update;
  display_6 display3 (
    .clk(clk),
    .rst(rst),
    .color(M_display3_color),
    .update(M_display3_update),
    .pixel(M_display3_pixel),
    .led(M_display3_led)
  );
  wire [4-1:0] M_display4_pixel;
  wire [1-1:0] M_display4_led;
  reg [96-1:0] M_display4_color;
  reg [1-1:0] M_display4_update;
  display_6 display4 (
    .clk(clk),
    .rst(rst),
    .color(M_display4_color),
    .update(M_display4_update),
    .pixel(M_display4_pixel),
    .led(M_display4_led)
  );
  wire [4-1:0] M_display5_pixel;
  wire [1-1:0] M_display5_led;
  reg [96-1:0] M_display5_color;
  reg [1-1:0] M_display5_update;
  display_6 display5 (
    .clk(clk),
    .rst(rst),
    .color(M_display5_color),
    .update(M_display5_update),
    .pixel(M_display5_pixel),
    .led(M_display5_led)
  );
  wire [4-1:0] M_display6_pixel;
  wire [1-1:0] M_display6_led;
  reg [96-1:0] M_display6_color;
  reg [1-1:0] M_display6_update;
  display_6 display6 (
    .clk(clk),
    .rst(rst),
    .color(M_display6_color),
    .update(M_display6_update),
    .pixel(M_display6_pixel),
    .led(M_display6_led)
  );
  wire [96-1:0] M_gamestates_row1;
  wire [96-1:0] M_gamestates_row2;
  wire [96-1:0] M_gamestates_row3;
  wire [96-1:0] M_gamestates_row4;
  wire [96-1:0] M_gamestates_row5;
  wire [5-1:0] M_gamestates_currentState;
  wire [8-1:0] M_gamestates_ll1;
  wire [8-1:0] M_gamestates_ll2;
  wire [8-1:0] M_gamestates_out;
  wire [1-1:0] M_gamestates_fail;
  wire [4-1:0] M_gamestates_car1Pos;
  wire [4-1:0] M_gamestates_car2Pos;
  wire [96-1:0] M_gamestates_rowcar;
  wire [8-1:0] M_gamestates_debug;
  reg [1-1:0] M_gamestates_car1left;
  reg [1-1:0] M_gamestates_car1right;
  reg [1-1:0] M_gamestates_car2left;
  reg [1-1:0] M_gamestates_car2right;
  gamestates_12 gamestates (
    .clk(clk),
    .rst(rst),
    .car1left(M_gamestates_car1left),
    .car1right(M_gamestates_car1right),
    .car2left(M_gamestates_car2left),
    .car2right(M_gamestates_car2right),
    .row1(M_gamestates_row1),
    .row2(M_gamestates_row2),
    .row3(M_gamestates_row3),
    .row4(M_gamestates_row4),
    .row5(M_gamestates_row5),
    .currentState(M_gamestates_currentState),
    .ll1(M_gamestates_ll1),
    .ll2(M_gamestates_ll2),
    .out(M_gamestates_out),
    .fail(M_gamestates_fail),
    .car1Pos(M_gamestates_car1Pos),
    .car2Pos(M_gamestates_car2Pos),
    .rowcar(M_gamestates_rowcar),
    .debug(M_gamestates_debug)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = rst;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    M_player1left_cond_in = player1leftBtn;
    player1left = M_player1left_cond_out;
    M_player1right_cond_in = player1rightBtn;
    player1right = M_player1right_cond_out;
    M_player2left_cond_in = player2leftBtn;
    player2left = M_player2left_cond_out;
    M_player2right_cond_in = player2rightBtn;
    player2right = M_player2right_cond_out;
    M_gamestates_car1left = player1left;
    M_gamestates_car1right = player1right;
    M_gamestates_car2left = player2left;
    M_gamestates_car2right = player2right;
    M_display1_update = 1'h1;
    M_display2_update = 1'h1;
    M_display3_update = 1'h1;
    M_display4_update = 1'h1;
    M_display5_update = 1'h1;
    M_display6_update = 1'h1;
    M_display1_color = M_gamestates_row1;
    row1 = M_display1_led;
    M_display2_color = M_gamestates_row2;
    row2 = M_display2_led;
    M_display3_color = M_gamestates_row3;
    row3 = M_display3_led;
    M_display4_color = M_gamestates_row4;
    row4 = M_display4_led;
    M_display5_color = M_gamestates_row5;
    row5 = M_display5_led;
    M_display6_color = M_gamestates_rowcar;
    row6 = M_display6_led;
    io_led[16+7-:8] = M_gamestates_debug;
  end
endmodule
