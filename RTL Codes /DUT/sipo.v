module ten_bit_sipo(po,si,clk,rst,shift_en);
    input si,clk,rst,shift_en;
    output reg [9:0]po;
    reg [9:0]temp;
    always@(posedge clk)
    begin
    if(rst)
    temp<=10'b0000000000;
    else if(shift_en==0)
    begin
    temp[9]<=si;
    temp[8]<=temp[9];
    temp[7]<=temp[8];
    temp[6]<=temp[7];
    temp[5]<=temp[6];
    temp[4]<=temp[5];
    temp[3]<=temp[4];
    temp[2]<=temp[3];
    temp[1]<=temp[2];
    temp[0]<=temp[1];
    end
    else 
    begin
    po<=temp;
    end
    //  $display("si=%h,po=%h",si,po);
    end
endmodule
