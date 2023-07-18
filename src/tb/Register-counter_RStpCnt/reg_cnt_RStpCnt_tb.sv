`timescale 1ns / 1ps


module reg_cnt_RStpCnt_tb
#(
  parameter BIT_W = 5
)
();

  logic             clk_i;
  logic             som_i;
  logic             stop_i;
  logic             blkf_i;

  logic [BIT_W-1:0] RStpCnt_o;

reg_cnt_RStpCnt DUT_RSC 
(
    .clk_i      ( clk_i ),
    .som_i      ( som_i ),
    .stop_i     ( stop_i ),
    .blkf_i     ( blkf_i ),

    .RStpCnt_o  ( RStpCnt_o )
);


  // CLK
  initial begin
    clk_i  = '0;
    forever #10 clk_i  = ~clk_i;
  end



  initial begin
    RStpCnt_o = 0;

    stop_i = 0;
    blkf_i = 0;

    som_i = 0;
    repeat (3)  @ ( posedge clk_i );
    som_i = 1;
    repeat (4)  @ ( posedge clk_i );
    stop_i = 1;
    repeat (5)  @ ( posedge clk_i );
    som_i = 0;
    blkf_i = 1;
    repeat (4)  @ ( posedge clk_i );
    stop_i = 0;
    repeat (5)  @ ( posedge clk_i );
    blkf_i = 0;
  end

endmodule
