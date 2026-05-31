module descrambler(
    input [7:0] data_in,
    input de_en,
    input de_rst,
    output reg [7:0] data_out,
    input rst,
    input clk
  );
   
     reg [15:0]lfsr_q;
     reg [15:0]lfsr_c;
    reg [7:0] data_c;
  
    always @(*) begin
      lfsr_q[0] = lfsr_c[8];
      lfsr_q[1] = lfsr_c[9];
      lfsr_q[2] = lfsr_c[10];
      lfsr_q[3] = lfsr_c[8] ^ lfsr_c[11];
      lfsr_q[4] = lfsr_c[8] ^ lfsr_c[9] ^ lfsr_c[12];
      lfsr_q[5] = lfsr_c[8] ^ lfsr_c[9] ^ lfsr_c[10] ^ lfsr_c[13];
      lfsr_q[6] = lfsr_c[9] ^ lfsr_c[10] ^ lfsr_c[11] ^ lfsr_c[14];
      lfsr_q[7] = lfsr_c[10] ^ lfsr_c[11] ^ lfsr_c[12] ^ lfsr_c[15];
      lfsr_q[8] = lfsr_c[0] ^ lfsr_c[11] ^ lfsr_c[12] ^ lfsr_c[13];
      lfsr_q[9] = lfsr_c[1] ^ lfsr_c[12] ^ lfsr_c[13] ^ lfsr_c[14];
      lfsr_q[10] = lfsr_c[2] ^ lfsr_c[13] ^ lfsr_c[14] ^ lfsr_c[15];
      lfsr_q[11] = lfsr_c[3] ^ lfsr_c[14] ^ lfsr_c[15];
      lfsr_q[12] = lfsr_c[4] ^ lfsr_c[15];
      lfsr_q[13] = lfsr_c[5];
      lfsr_q[14] = lfsr_c[6];
      lfsr_q[15] = lfsr_c[7];
  
      data_c[0] = data_in[0] ^ lfsr_c[15];
      data_c[1] = data_in[1] ^ lfsr_c[14];
      data_c[2] = data_in[2] ^ lfsr_c[13];
      data_c[3] = data_in[3] ^ lfsr_c[12];
      data_c[4] = data_in[4] ^ lfsr_c[11];
      data_c[5] = data_in[5] ^ lfsr_c[10];
      data_c[6] = data_in[6] ^ lfsr_c[9];
      data_c[7] = data_in[7] ^ lfsr_c[8];
    end // always
  
    always @(posedge clk) begin
      if(rst) begin
        lfsr_c <= {16{1'b1}};
        data_out <= {8{1'b0}};
      end
      else begin
        lfsr_c <= de_rst ? {16{1'b1}} : de_en ? lfsr_q : lfsr_c;
        data_out <= de_en ? data_c : data_out;
      end
  end //always
  endmodule
  


