class serdes_sequence extends uvm_sequence#(serdes_seq_item);
	`uvm_object_utils(serdes_sequence)
	serdes_seq_item pkt[11:0];

	function new(string name = "serdes_sequence");
		super.new(name);
	endfunction

	virtual task body();
	foreach(pkt[i])
		pkt[i] = serdes_seq_item :: type_id :: create($sformatf("pkt[i]=%0d",pkt[i]));

	
	repeat(50) begin
		`uvm_do_with(pkt[0],{scram_en==0;
								scram_rst==0;
								k_pin==0;
								l==0;
								shift_en==0;
								par_en==0;
								de_en==0;
								de_rst==0;});
		
		`uvm_do_with(pkt[1], {
								scram_en==1;
								scram_rst == pkt[0].scram_rst;
								k_pin == pkt[0].k_pin;
								l == pkt[0].l;
								shift_en== pkt[0].shift_en;
								par_en==pkt[0].par_en;
								de_en==pkt[0].de_en;
								de_rst==pkt[0].de_rst;
								foreach(data_IN[i])
								data_IN == pkt[0].data_IN;});
		#10;
		//#0.2;
		`uvm_do_with(pkt[2], {
								scram_en==pkt[1].scram_en;
								scram_rst == 1;
								k_pin == pkt[1].k_pin;
								l == pkt[1].l;
								shift_en== pkt[1].shift_en;
								par_en==pkt[1].par_en;
								de_en==pkt[1].de_en;
								de_rst==pkt[1].de_rst;

								foreach(data_IN[i])
								data_IN == pkt[0].data_IN;});
		`uvm_do_with(pkt[3], {
								scram_en==pkt[2].scram_en;
								scram_rst == pkt[2].scram_rst;
								k_pin == 1;
								l == pkt[2].l;
								shift_en== pkt[2].shift_en;
								par_en==pkt[2].par_en;
								de_en==pkt[2].de_en;
								de_rst==pkt[2].de_rst;

								foreach(data_IN[i])
								data_IN == pkt[0].data_IN;});

		`uvm_do_with(pkt[4], {
								scram_en==pkt[3].scram_en;
								scram_rst == pkt[3].scram_rst;
								k_pin == 0;
								l == pkt[3].l;
								shift_en== pkt[3].shift_en;
								par_en==pkt[3].par_en;
								de_en==pkt[3].de_en;
								de_rst==pkt[3].de_rst;

								foreach(data_IN[i])
								data_IN == pkt[0].data_IN;});

		#90;
		//#1.8;
		`uvm_do_with(pkt[5], {
								scram_en==pkt[4].scram_en;
								scram_rst == pkt[4].scram_rst;
								k_pin == pkt[4].k_pin;
								l == 1;
								shift_en== pkt[4].shift_en;
								par_en==pkt[4].par_en;
								de_en==pkt[4].de_en;
								de_rst==pkt[4].de_rst;

								foreach(data_IN[i])
								data_IN == pkt[0].data_IN;});

		#100;
		//#2;
		`uvm_do_with(pkt[6], {
								scram_en==pkt[5].scram_en;
								scram_rst == pkt[5].scram_rst;
								k_pin == pkt[5].k_pin;
								l == pkt[5].l;
								shift_en== 1;
								par_en==pkt[5].par_en;
								de_en==pkt[5].de_en;
								de_rst==pkt[5].de_rst;

								foreach(data_IN[i])
								data_IN == pkt[0].data_IN;});

		#30;
		//#0.6;
		`uvm_do_with(pkt[7], {
								scram_en==pkt[6].scram_en;
								scram_rst == pkt[6].scram_rst;
								k_pin == pkt[6].k_pin;
								l == pkt[6].l;
								shift_en== pkt[6].shift_en;
								par_en==1;
								de_en==pkt[6].de_en;
								de_rst==pkt[6].de_rst;

								foreach(data_IN[i])
								data_IN == pkt[0].data_IN;});
		#30;
		//#0.6;
		`uvm_do_with(pkt[8], {
								scram_en==pkt[7].scram_en;
								scram_rst == pkt[7].scram_rst;
								k_pin == pkt[7].k_pin;
								l == pkt[7].l;
								shift_en== pkt[7].shift_en;
								par_en==0;
								de_en==pkt[7].de_en;
								de_rst==pkt[7].de_rst;

								foreach(data_IN[i])
								data_IN == pkt[0].data_IN;});

		`uvm_do_with(pkt[9], {//de_rst==1;
								scram_en==pkt[8].scram_en;
								scram_rst == pkt[8].scram_rst;
								k_pin == pkt[8].k_pin;
								l == pkt[8].l;
								shift_en== pkt[8].shift_en;
								par_en==pkt[8].par_en;
								de_en==pkt[8].de_en;
								de_rst==1;

								foreach(data_IN[i])
								data_IN == pkt[0].data_IN;});

		#10;
		//#0.2;
		`uvm_do_with(pkt[10], {//de_rst==0;
								scram_en==pkt[9].scram_en;
								scram_rst == pkt[9].scram_rst;
								k_pin == pkt[9].k_pin;
								l == pkt[9].l;
								shift_en== pkt[9].shift_en;
								par_en==pkt[9].par_en;
								de_en==pkt[9].de_en;
								de_rst==0;

								foreach(data_IN[i])
								data_IN == pkt[0].data_IN;});

		`uvm_do_with(pkt[11], {//de_en==1;
								scram_en==pkt[10].scram_en;
								scram_rst == pkt[10].scram_rst;
								k_pin == pkt[10].k_pin;
								l == pkt[10].l;
								shift_en== pkt[10].shift_en;
								par_en==pkt[10].par_en;
								de_en==1;
								de_rst==pkt[10].de_rst;

								foreach(data_IN[i])
								data_IN == pkt[0].data_IN;});

		#10;
		 // #0.2;
		
		end
	endtask
endclass

