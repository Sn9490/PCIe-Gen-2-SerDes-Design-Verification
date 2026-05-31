class serdes_agent1 extends uvm_agent;
	`uvm_component_utils(serdes_agent1)

	serdes_sequencer sqr;
	serdes_driver drv;
	serdes_monitor1 mon1;

	function new(string name="serdes_agent1",uvm_component parent);
		super.new(name,parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		sqr = serdes_sequencer :: type_id :: create("sqr",this);
		drv = serdes_driver :: type_id :: create("drv",this);
		mon1 = serdes_monitor1 :: type_id :: create("mon1",this);

		`uvm_info(get_full_name(),"-------[agent1] [build phase]",UVM_NONE)
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		drv.seq_item_port.connect(sqr.seq_item_export);
		`uvm_info(get_full_name(),"-------[agent1] [connect phase]",UVM_NONE)
	endfunction
endclass
		

