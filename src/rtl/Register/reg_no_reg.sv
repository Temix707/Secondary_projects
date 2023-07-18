module reg_no_reg
#(
  parameter BIT_32 = 32
)
(
  input  logic               clk_i,
  input  logic               srst_i,

  input  logic  [BIT_32-1:0] data_d_i,
 
  output logic  [BIT_32-1:0] data_0_q_o,
  output logic  [BIT_32-1:0] data_1_q_o
);



////////////////
//   Input d  //
////////////////

logic [BIT_32-1:0]  data_0_q;

always_ff @( posedge clk_i ) begin
  if( srst_i ) begin
    data_0_q <= 0;
  end
  else begin
    data_0_q <= data_d_i;
  end
end

assign data_0_q_o = data_0_q;




//////////////////
// Input d, reg //
//////////////////

logic [BIT_32-1:0]  data_1_d, data_1_q;

always_ff @( posedge clk_i ) begin
  if( srst_i ) begin
    data_1_d <= 0;
    data_1_q <= 0;
  end
  else begin
    data_1_d <= data_d_i;
    data_1_q <= data_1_d;
  end
end

assign data_1_q_o = data_1_q;



endmodule