interface serdes_interface(input logic clk,rst);
	logic [7:0]data_IN;
	logic [7:0]data_OUT;
	logic scram_en,scram_rst;
	logic k_pin;
	logic l;
	logic shift_en;
	logic par_en;
	logic de_en,de_rst;

	modport dut(input clk,rst,data_IN,scram_en,scram_rst,k_pin,l,shift_en,par_en,de_en,de_rst, output data_OUT);
	modport tb(output clk,rst,data_IN,scram_en,scram_rst,k_pin,l,shift_en,par_en,de_en,de_rst, input data_OUT);

	// property p6(clk);
    //     realtime a;
    //     @(posedge clk)
    //     //(1,a = $realtime) |=> ($realtime - a) <= 5;  // FAIL_ASSERTION
    //     (1,a = $realtime) |=> ($realtime - a) >= 5;  // PASS_ASSERTION
    // endproperty
    //     a_6:assert property(p6(clk));

endinterface

