`timescale 1ns / 1ps

module reg_sum_tb();

  logic       clk_i;
  logic [7:0] x_i [3:0];

  logic [7:0] no_pipe_res_o;
  logic [7:0] pipe_res_o;


  reg_sum DUT_REG_SUM
  (
    .clk_i          ( clk_i         ),
    .x_i            ( x_i           ),

    .no_pipe_res_o  ( no_pipe_res_o ),
    .pipe_res_o     ( pipe_res_o    )
  );


  // CLK
  initial begin
    clk_i  = '0;
    forever #10 clk_i  = ~clk_i;
  end


  initial begin
    repeat (2)  @ ( posedge clk_i );
    x_i[0] <= 4;
    x_i[1] <= 6;
    x_i[2] <= 9;
    x_i[3] <= 3;

    repeat (3)  @ ( posedge clk_i );
    x_i[0] <= 9;
    x_i[1] <= 5;
    x_i[2] <= 2;
    x_i[3] <= 2;

    repeat (3)  @ ( posedge clk_i );
    x_i[0] <= 2;
    x_i[1] <= 3;
    x_i[2] <= 9;
    x_i[3] <= 7;

    repeat (3)  @ ( posedge clk_i );
  end



endmodule
