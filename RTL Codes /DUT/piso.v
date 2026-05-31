module ten_bit_piso( clk,rst,l,pi,so );
    output reg so;
    input [9:0] pi;
    input clk,rst;
    input l;
    reg [9:0]temp;
    always @ (posedge clk) begin
    if(rst==1)
     so<=0;
     else if(rst==0 && l==0)
     begin
      temp <= pi;
     end
     else if(l==1)begin
      so  <=  temp[0];
	  temp[0] <= temp[1];
	  temp[1] <= temp[2];
	  temp[2] <= temp[3];
	  temp[3] <= temp[4];
	  temp[4] <= temp[5];
	  temp[5] <= temp[6];
	  temp[6] <= temp[7];
	  temp[7] <= temp[8];
	  temp[8] <= temp[9];
	  temp[9] <= 0;
      //temp <= {1'b0, temp[9:1]};
     end 
    // $display("pi=%h,so=%h",pi,so);
    end
endmodule 
