class serdes_driver extends uvm_driver #(serdes_seq_item);
	`uvm_component_utils(serdes_driver)

	serdes_seq_item pkt;

	virtual interface serdes_interface intf;

	function new(string name = "serdes_driver", uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		pkt = serdes_seq_item :: type_id :: create("pkt");
		if(!uvm_config_db #(virtual serdes_interface) :: get(this,"*","serdes_interface",intf))
		begin
			`uvm_error(get_type_name(),"config_db not reteiving values")
		end
		`uvm_info(get_full_name(),"-------[driver] [build phase]",UVM_NONE)
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info(get_full_name(),"-------[driver] [run phase]",UVM_NONE)
		forever begin
			seq_item_port.get_next_item(pkt);
			pkt.print();
			//@(posedge intf.clk);
			intf.data_IN <= pkt.data_IN;
			intf.scram_rst <= pkt.scram_rst;
			intf.scram_en <= pkt.scram_en;
			intf.k_pin <= pkt.k_pin;
			intf.l <= pkt.l;
			intf.shift_en <= pkt.shift_en;
			intf.par_en <= pkt.par_en;
			intf.de_en <= pkt.de_en;
			intf.de_rst <= pkt.de_rst;
			//#1;
			@(posedge intf.clk);
			if(pkt.scram_rst==1 && pkt.scram_en==1 && pkt.k_pin==0 && pkt.l==1 && pkt.shift_en==1 && pkt.par_en==0 && pkt.de_en==1 && pkt.de_rst==0) begin
			`uvm_info(get_type_name(), $sformatf("data_IN=%0b, scram_rst=%0b, scram_en=%0b, k_pin=%0b, l=%0b, shift_en=%0b, par_en=%0b, de_en=%0b, de_rst=%0b",intf.data_IN, intf.scram_rst, intf.scram_en, intf.k_pin, intf.l, intf.shift_en, intf.par_en, intf.de_en, intf.de_rst),UVM_NONE)
			end
			seq_item_port.item_done();
		end
	endtask
endclass
			
