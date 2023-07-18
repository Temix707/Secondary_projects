module reg_cnt_RStpCnt
#(
  parameter BIT_W = 5
)
(
    input   logic             clk_i,
    input   logic             som_i,
    input   logic             stop_i,
    input   logic             blkf_i,

    output  logic [BIT_W-1:0] RStpCnt_o
);

  always_ff @( posedge clk_i ) begin
    if( som_i && stop_i ) begin
        RStpCnt_o <= RStpCnt_o + 1;
    end
  end

  always_ff @( posedge clk_i ) begin
    if( ~som_i && stop_i && blkf_i ) begin
      RStpCnt_o <= RStpCnt_o;
    end
    else if ( blkf_i ) begin
      RStpCnt_o <= RStpCnt_o - 1;
    end
  end



endmodule
