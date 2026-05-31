module serdes_assertion(
    input clk ,rst,shift_en,par_en,scram_en,scram_rst,
    input [7:0]data_IN,
    input l,k_pin,de_en,de_rst,
    output [7:0]data_OUT
    );
    property p1(clk);
        realtime a;
        @(posedge clk)
        (1,a = $realtime) |=> ($realtime - a) >= 5; 
    endproperty
        a_1:assert property(p1(clk));
    
    property p2;
        @(posedge clk) !scram_en |-> ##[0:10] scram_en;
    endproperty
        a_2:assert property(p2);

    property p3;
        @(posedge clk) rst |-> ##[0:40] !rst;
    endproperty
        a_3:assert property(p3);
    
    property p4;
        @(posedge clk) rst |-> !$isunknown(data_IN);
    endproperty
        a_4:assert property(p4);

    property p5;
        @(posedge clk) scram_en |-> scram_rst |-> !$isunknown(data_OUT);
    endproperty
        a_5:assert property(p5);

    property p6;
        @(posedge clk) par_en |-> ##[0:40] !par_en; 
    endproperty
        a_6:assert property(p6);

    sequence seqa;
         !de_en ##[0:380] de_en; 
    endsequence

    sequence seqb;
         !de_rst ##[0:350] de_rst;
    endsequence

    property p7;
       @(posedge clk) seqa |-> seqb;
    endproperty
        a_7:assert property(p7);
    
    sequence seqc;
        !shift_en ##[0:260] shift_en;
    endsequence

    sequence seqd;
        !l ##[0:150] l;
    endsequence
        
    property p8;
        @(posedge clk) seqc |-> ##[0:110] seqd;
    endproperty
        a_8:assert property(p8);
endmodule