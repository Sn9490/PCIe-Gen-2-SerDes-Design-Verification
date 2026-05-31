class serdes_environment extends uvm_env;
	`uvm_component_utils(serdes_environment)

	serdes_agent1 agt1;
	serdes_agent2 agt2;
	serdes_scoreboard scrb;
	serdes_coverages covr;

	function new(string name = "serdes_environment", uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		agt1 = serdes_agent1 :: type_id :: create("agt1",this);
		agt2 = serdes_agent2 :: type_id :: create("agt2",this);
		scrb = serdes_scoreboard :: type_id :: create("scrb",this);
		covr = serdes_coverages :: type_id :: create("covr",this);

		`uvm_info(get_full_name(),"-------[environment] [build phase]",UVM_NONE)
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		agt1.mon1.any_port.connect(scrb.any_imp_port);
		agt2.mon2.put_port.connect(scrb.put_imp_port);
		agt1.mon1.any_port.connect(covr.sub_recv);
		`uvm_info(get_full_name(),"-------[environment] [connect phase]",UVM_NONE)
	endfunction
	

	function void end_of_elaboration_phase(uvm_phase phase);
		`uvm_info(get_full_name(), "-------[environment] [end of elaboration]",UVM_NONE)
		uvm_top.print_topology();
	endfunction
endclass
