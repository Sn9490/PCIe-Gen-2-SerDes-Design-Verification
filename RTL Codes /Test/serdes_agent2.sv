class serdes_agent2 extends uvm_agent;
	`uvm_component_utils(serdes_agent2)

	serdes_monitor2 mon2;

	function new(string name, uvm_component parent);
		super.new(name,parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		mon2 = serdes_monitor2 :: type_id :: create("mon2",this);
		`uvm_info(get_full_name(),"-------[agent2] [build phase]",UVM_NONE)
	endfunction

endclass

