class serdes_scoreboard extends uvm_scoreboard;
	`uvm_component_utils(serdes_scoreboard)

	uvm_analysis_imp #(serdes_seq_item, serdes_scoreboard) any_imp_port;
	uvm_blocking_put_imp #(serdes_seq_item, serdes_scoreboard) put_imp_port;
	//uvm_analysis_imp #(serdes_seq_item, serdes_scoreboard) analysis_export;

	serdes_seq_item ref_pkt;
	serdes_seq_item dut_pkt;

	function new(string name,uvm_component parent);
		super.new(name,parent);
		any_imp_port = new("any_imp_port",this);
		put_imp_port = new("put_imp_port",this);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		ref_pkt = serdes_seq_item :: type_id :: create("ref_pkt");
		dut_pkt = serdes_seq_item :: type_id :: create("dut_pkt");
		`uvm_info(get_full_name(),"-------[scoreboard] [build phase]",UVM_NONE)
	endfunction

	task write(serdes_seq_item ref_pkt);
		this.ref_pkt = ref_pkt;
	endtask

	task put(serdes_seq_item dut_pkt);
		this.dut_pkt = dut_pkt;
		if(ref_pkt.scram_rst==1 && ref_pkt.scram_en==1 && ref_pkt.k_pin==0 && ref_pkt.l==1 && ref_pkt.shift_en==1 && ref_pkt.par_en==0 && ref_pkt.de_en==1 && ref_pkt.de_rst==0 && dut_pkt.data_OUT != 0) begin
			if(ref_pkt.data_IN == dut_pkt.data_OUT) begin
				`uvm_info(get_name(),$sformatf("data_IN=%0b, data_OUT=%0b",ref_pkt.data_IN,dut_pkt.data_OUT),UVM_NONE)
				`uvm_info(get_full_name(), "--------------test passed--------------",UVM_NONE)
			end
			else begin
				`uvm_info(get_name(),$sformatf("data_IN=%0b, data_OUT=%0b",ref_pkt.data_IN,dut_pkt.data_OUT),UVM_NONE)
				`uvm_info(get_full_name(), "--------------test failed--------------",UVM_NONE)
			end
		end
	endtask


	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info(get_full_name(),"-------[scoreboard] [run phase]",UVM_NONE)
	endtask

endclass

			
