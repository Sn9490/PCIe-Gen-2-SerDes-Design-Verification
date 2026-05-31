`include "uvm_macros.svh"
import uvm_pkg :: *;

`include "serdes_seq_item.sv"
`include "serdes_sequence.sv"
`include "serdes_driver.sv"
`include "serdes_sequencer.sv"
`include "serdes_monitor1.sv"
`include "serdes_agent1.sv"
`include "serdes_monitor2.sv"
`include "serdes_agent2.sv"
`include "serdes_coverages.sv"
`include "serdes_scoreboard.sv"
`include "serdes_environment.sv"
`include "serdes_test.sv"

`include "serdes_interface.sv"
`include "serdes_dut.v"

`include "serdes_assertions.sv"

module serdes_top;
	bit clk,rst;
	always #5 clk = ~clk;
	 always begin
	 #40 rst = ~rst;
	 #360 rst = ~rst;
	 end
	serdes_interface intf(clk,rst);

	serdes_dut dut(.data_IN(intf.data_IN), .data_OUT(intf.data_OUT), .clk(intf.clk), .rst(intf.rst), .l(intf.l), .shift_en(intf.shift_en), .k_pin(intf.k_pin), .par_en(intf.par_en), .scram_en(intf.scram_en), .scram_rst(intf.scram_rst), .de_en(intf.de_en), .de_rst(intf.de_rst));
	bind serdes_dut serdes_assertion label(.data_IN(data_IN), .data_OUT(data_OUT), .clk(clk), .rst(rst), .l(l), .shift_en(shift_en), .k_pin(k_pin), .par_en(par_en), .scram_en(scram_en), .scram_rst(scram_rst), .de_en(de_en), .de_rst(de_rst));

	initial begin
		uvm_config_db #(virtual serdes_interface) :: set(null,"*","serdes_interface",intf);
		clk = 1;
		rst = 1;
	end

	initial begin
		run_test(" ");
	end

    initial #1000 $finish;

endmodule
