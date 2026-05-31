class serdes_coverages extends uvm_subscriber #(serdes_seq_item);

	`uvm_component_utils(serdes_coverages)

	uvm_analysis_imp#(serdes_seq_item,serdes_coverages) sub_recv;

	 bit [7:0] data_IN;
	 bit scram_en, scram_rst;
	 bit k_pin;
	 bit l;
	 bit shift_en;
	 bit par_en;
	 bit de_en,de_rst;

	 covergroup cvg0;
		option.per_instance = 1;
		cp01 : coverpoint data_IN {bins b1 = {[-30:30]};
										bins b2[2] = {[30:60],[70:100]};
										bins b3[4] = {[-100:200]};
										ignore_bins b4[2] = {1, 10, 12};
										bins b5 = (2=>5[=3]=>7);
										}
		cp02 : coverpoint scram_en {bins a1 = (1 => 1 => 0 => 1);}
		cp03 : coverpoint scram_rst {bins a2 = (0 => 1 => 0 => 1);}
		cp04 : coverpoint k_pin {bins b1[] = (0,1 => 1,0);}
		cp05 : coverpoint l {ignore_bins b2 = (0=>0=>0);}
		cp06 : coverpoint shift_en;
		cp07 : coverpoint par_en;
		cp08 : coverpoint de_en;
		cp09 : coverpoint de_rst;
	endgroup

	covergroup cvg1;
		option.per_instance = 1;
		cp11 : coverpoint data_IN {bins b1 = (8'hb3=>8'h63);
								   bins b2[] = (8'h9a[*2:4]);
								   ignore_bins b3 = {8'h16,8'h7c};
								   illegal_bins b4 = {8'h3d};
								   bins b5 = (8'hb7 => 8'hbd);
									}
	endgroup

	covergroup cvg2;
		option.per_instance = 1;
		cp21 : coverpoint scram_en iff(!scram_rst);
		cp22 : coverpoint l { bins x1 = {0};
							  bins x2 = {1};
								}
		cp23 : coverpoint shift_en { bins x1 = {0};  
								     bins y2 = {1};
										}
		cp24 : cross cp22, cp23 { bins xy1 = binsof(cp22.x1);
								  bins xy2 = binsof(cp23.y2);
								}
	endgroup

	function new(string name, uvm_component parent);
		super.new(name,parent);
		cvg0 = new();
		cvg1 = new();
		cvg2 = new();
		sub_recv = new("sub_recv",this);
	endfunction

	virtual function void write(serdes_seq_item t);
		data_IN = t.data_IN;
		scram_en = t.scram_en;
		scram_rst = t.scram_rst;
		k_pin = t.k_pin;
		shift_en = t.shift_en;
		par_en = t.par_en;
		de_en = t.de_en;
		de_rst = t.de_rst;
		cvg0.sample();
		cvg1.sample();
		cvg2.sample();
	endfunction
endclass
