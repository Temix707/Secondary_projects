`timescale 1ns / 1ps


class trans; 
  rand bit [7:0] pixel;

  function automatic logic [7:0] random_val( logic [7:0] pixel); 
    this.pixel = pixel;  
    return this.pixel;
  endfunction

  function automatic logic [7:0] print( logic [7:0] data_d_i );
    $display("Incoming Pixel = %0d", data_d_i);
  endfunction
endclass


module reg_no_reg_tb
# (  parameter BIT_32 = 32 )
();


  logic                clk_i;
  logic                srst_i;

  logic  [BIT_32-1:0]  data_d_i;
 
  logic  [BIT_32-1:0]  data_0_q_o; 
  logic  [BIT_32-1:0]  data_1_q_o;


  reg_no_reg DUT_REG
  (
    .clk_i      ( clk_i       ),
    .srst_i     ( srst_i      ),

    .data_d_i   ( data_d_i    ),

    .data_0_q_o ( data_0_q_o  ),
    .data_1_q_o ( data_1_q_o  )
  );    


  trans pkt;

  // CLK
  initial begin
    clk_i  = '0;
    forever #10 clk_i  = ~clk_i;
  end


  initial begin     
    srst_i  <= 1;
    repeat (2)  @ ( posedge clk_i );
    //#10;
    srst_i  <= 0;

    data_d_i = 50; 
    repeat (3)  @ ( posedge clk_i );
    data_d_i <= 27;

    repeat (3)  @ ( posedge clk_i );
    data_d_i <= 7;

    //pkt = new();

    /*if( !srst_i ) begin
      valid_i = 1;
      repeat ( 35 ) @ ( posedge clk_i );
      valid_i = 0;
    end*/

  end



  ////////////////////////
  // Random input data  //
  ////////////////////////

/*
  logic [BIT_32 - 1:0] data_i_que [$];
  logic [BIT_32 - 1:0] cnt_data_o_que [$];


  always_ff @( posedge clk_i ) begin
    if( srst_i ) begin
      data_i_que     = {};  
      cnt_data_o_que = {};                                                            
    end
    else begin
      pkt.randomize();
      data_d_i = pkt.random_val( pkt.pixel); 
      data_i_que.push_back( data_d_i );

      $display( "\tData_i: %0d, \tSize: %0d, \tTime: %0t", data_d_i, data_i_que.size(), $time );
    end
  end
*/

endmodule
