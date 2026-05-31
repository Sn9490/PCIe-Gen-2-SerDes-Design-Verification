class serdes_monitor1 extends uvm_monitor;

	`uvm_component_utils(serdes_monitor1)

	virtual interface serdes_interface intf;

	serdes_seq_item pkt;

	uvm_analysis_port #(serdes_seq_item) any_port;

	function new(string name, uvm_component parent);
		super.new(name,parent);
		any_port = new("any_port",this);
	endfunction

	function void build_phase(uvm_phase phase);
		if(!uvm_config_db #(virtual serdes_interface) :: get(this,"*","serdes_interface",intf))
			`uvm_error(get_type_name(),"config_db not retrieving values")
		`uvm_info(get_full_name(),"-------[monitor1] [build phase]",UVM_NONE)
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		pkt = serdes_seq_item :: type_id :: create("pkt");
		`uvm_info(get_full_name(), "-------[monitor1] [run phase]",UVM_NONE)
		forever begin
		#1;
			//#0.02;
		@(posedge intf.clk);
		pkt.data_IN <= intf.data_IN;
		pkt.scram_rst <= intf.scram_rst;
		pkt.scram_en <= intf.scram_en;
		pkt.k_pin <= intf.k_pin;
		pkt.l <= intf.l;
		pkt.shift_en <= intf.shift_en;
		pkt.par_en <= intf.par_en;
		pkt.de_en <= intf.de_en;
		pkt.de_rst <= intf.de_rst;
		@(posedge intf.clk);
		any_port.write(pkt);         // send data to the tlm fifo port 
		if(pkt.scram_rst==1 && pkt.scram_en==1 && pkt.k_pin==0 && pkt.l==1 && pkt.shift_en==1 && pkt.par_en==0 && pkt.de_en==1 && pkt.de_rst==0) begin
		`uvm_info(get_type_name(), $sformatf("data_IN=%0b, scram_rst=%0b, scram_en=%0b, k_pin=%0b, l=%0b, shift_en=%0b, par_en=%0b, de_en=%0b, de_rst=%0b",pkt.data_IN, pkt.scram_rst, pkt.scram_en, pkt.k_pin, pkt.l, pkt.shift_en, pkt.par_en, pkt.de_en, pkt.de_rst),UVM_NONE)
		end
		end
	endtask

endclass


