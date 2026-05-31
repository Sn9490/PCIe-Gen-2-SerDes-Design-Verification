class serdes_monitor2 extends uvm_monitor;
	`uvm_component_utils(serdes_monitor2)

	virtual interface serdes_interface intf;

	serdes_seq_item pkt;

	uvm_blocking_put_port #(serdes_seq_item) put_port;

	function new(string name, uvm_component parent);
		super.new(name,parent);
		put_port = new("put_port",this);
	endfunction

	function void build_phase(uvm_phase phase);
		pkt = serdes_seq_item :: type_id :: create("pkt");
		if(!uvm_config_db #(virtual serdes_interface) :: get(this,"*","serdes_interface",intf))
			`uvm_error(get_type_name(),"config_db not retreiving values")
		`uvm_info(get_full_name(),"-------[monitor2] [build_phase]",UVM_NONE)
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info(get_full_name(),"-------[monitor2] [run_phase]",UVM_NONE)
		forever begin
			@(posedge intf.clk);
			pkt.data_OUT <= intf.data_OUT;
			#1;
		//	#0.02;
			put_port.put(pkt);
			if(pkt.data_OUT!=0)
			`uvm_info(get_type_name(),$sformatf("data_OUT=%0b",pkt.data_OUT),UVM_NONE)
		end
	endtask
endclass
