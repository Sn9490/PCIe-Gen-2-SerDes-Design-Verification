class serdes_test extends uvm_test;
	`uvm_component_utils(serdes_test)

	serdes_environment env;
	serdes_sequence seq;

	function new(string name, uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		env = serdes_environment :: type_id :: create("env",this);
		//seq = serdes_sequence :: type_id :: create("seq",this);
		`uvm_info(get_full_name(),"-------[test case] [build phase]",UVM_NONE)
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		seq = serdes_sequence :: type_id :: create("seq");
		phase.raise_objection(this);
		seq.start(env.agt1.sqr);
		phase.drop_objection(this);
	endtask
endclass
	
