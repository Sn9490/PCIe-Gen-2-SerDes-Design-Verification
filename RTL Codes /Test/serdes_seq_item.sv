class serdes_seq_item extends uvm_sequence_item;

	rand bit [7:0] data_IN;
	rand bit scram_en, scram_rst;
	rand bit k_pin;
	rand bit l;
	rand bit shift_en;
	rand bit par_en;
	rand bit de_en,de_rst;
	bit [7:0] data_OUT;

	`uvm_object_utils_begin(serdes_seq_item)
	`uvm_field_int(data_IN , UVM_ALL_ON)
	`uvm_field_int(scram_en, UVM_ALL_ON)
	`uvm_field_int(scram_rst, UVM_ALL_ON)
	`uvm_field_int(k_pin, UVM_ALL_ON)
	`uvm_field_int(l, UVM_ALL_ON)
	`uvm_field_int(shift_en, UVM_ALL_ON)
	`uvm_field_int(par_en, UVM_ALL_ON)
	`uvm_field_int(de_en, UVM_ALL_ON)
	`uvm_field_int(de_rst, UVM_ALL_ON)
	`uvm_field_int(data_OUT, UVM_ALL_ON)
	`uvm_object_utils_end

	function new(string name= "serdes_seq_item");
		super.new(name);
	endfunction
endclass


