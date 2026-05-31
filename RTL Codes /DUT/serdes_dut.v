
`include "scrambler.v"
`include "encoder.v"
`include "piso.v"
`include "sipo.v"
`include "decoder.v"
`include "descrambler.v"
    
module serdes_dut(data_IN,data_OUT,clk,rst,l,shift_en,k_pin,par_en,scram_en,scram_rst,de_en,de_rst);
    input clk ,rst,shift_en,par_en,scram_en,scram_rst;
    input [7:0]data_IN;
    input l,k_pin,de_en,de_rst;
    output [7:0]data_OUT;
    wire w;
    wire [9:0]en_out;
    wire [9:0]de_out;
    wire [7:0]sc_out;
    wire [7:0]dc_out;
    scrambler m5(.clk(clk),.rst(rst),.scram_en(scram_en),.scram_rst(scram_rst),.data_in(data_IN),.data_out(sc_out));
    encoder m3(.clk(clk),.rst(rst),.data_in(sc_out),.k_pin(k_pin),.data_out(en_out));
    ten_bit_piso m1(.so(w),.clk(clk),.rst(rst),.pi(en_out),.l(l));
    ten_bit_sipo m2(.po(de_out),.si(w),.clk(clk),.rst(rst),.shift_en(shift_en));
    decoder m4(.data_out(dc_out),.data_in(de_out),.clk(clk),.rst(rst),.par_en(par_en));
    descrambler m6(.clk(clk),.rst(rst),.de_en(de_en),.de_rst(de_rst),.data_in(dc_out),.data_out(data_OUT));
endmodule
