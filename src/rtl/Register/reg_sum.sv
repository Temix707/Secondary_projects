module reg_sum(
  input   logic       clk_i,

  input   logic [7:0] x_i [3:0],

  output  logic [7:0] no_pipe_res_o,
  output  logic [7:0] pipe_res_o
);

  // no pipeline
  always_ff @( posedge clk_i ) begin
    no_pipe_res_o <= ( x_i[0] + x_i[1] ) + ( x_i[2] + x_i[3] );
  end

// pipeline
logic [7:0] s1 = '0;
logic [7:0] s2 = '0;

  always_ff @( posedge clk_i ) begin
    s1         <= x_i[0] + x_i[1];
    s2         <= x_i[2] + x_i[3];
    pipe_res_o <= s1 + s2;
  end

endmodule