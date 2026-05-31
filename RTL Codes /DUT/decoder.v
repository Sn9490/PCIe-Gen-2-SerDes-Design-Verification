module decoder(
    input           		clk,
    input           		rst,
    input [9:0]     	data_in,
    input           		par_en,
    output reg [7:0]    	data_out
);

    reg [2:0]       temp_3b;
    reg [4:0]       temp_5b;

    always @ (posedge clk) begin
        if (rst) begin
            temp_3b <= 3'b000;
            temp_5b <= 5'b00000;
        end
        else if (rst == 0 && par_en == 1)
            //  fork
            begin
             
                case (data_in[9:6])
                4'b0100: temp_3b <= 3'b000;
                4'b1001: temp_3b <= 3'b001;
                4'b0101: temp_3b <= 3'b010;
                4'b0011: temp_3b <= 3'b011;
                4'b0010: temp_3b <= 3'b100;
                4'b1010: temp_3b <= 3'b101;
                4'b0110: temp_3b <= 3'b110;
                4'b0001: temp_3b <= 3'b111;
                default: temp_3b <= 3'b000;    
                endcase
                case (data_in[5:0])
                6'b011000: temp_5b <= 5'b00000;
                6'b011101: temp_5b <= 5'b00001;
                6'b010010: temp_5b <= 5'b00010;     
                6'b110001: temp_5b <= 5'b00011;
                6'b110101: temp_5b <= 5'b00100;
                6'b101001: temp_5b <= 5'b00101;
                6'b011001: temp_5b <= 5'b00110;
                6'b111000: temp_5b <= 5'b00111;
                6'b111001: temp_5b <= 5'b01000;
                6'b100101: temp_5b <= 5'b01001;
                6'b010101: temp_5b <= 5'b01010;
                6'b110100: temp_5b <= 5'b01011;
                6'b001101: temp_5b <= 5'b01100;
                6'b101100: temp_5b <= 5'b01101;
                6'b011100: temp_5b <= 5'b01110;
                6'b010111: temp_5b <= 5'b01111;
                6'b011011: temp_5b <= 5'b10000;
                6'b100011: temp_5b <= 5'b10001;
                6'b010011: temp_5b <= 5'b10010;
                6'b110010: temp_5b <= 5'b10011;
                6'b001011: temp_5b <= 5'b10100;
                6'b101010: temp_5b <= 5'b10101;
                6'b011010: temp_5b <= 5'b10110;
                6'b111010: temp_5b <= 5'b10111;
                6'b110011: temp_5b <= 5'b11000;
                6'b100110: temp_5b <= 5'b11001;
                6'b010110: temp_5b <= 5'b11010;
                6'b110110: temp_5b <= 5'b11011;
                6'b001110: temp_5b <= 5'b11100;
                6'b101110: temp_5b <= 5'b11101;
                6'b011110: temp_5b <= 5'b11110;
                6'b101011: temp_5b <= 5'b11111;
                default: temp_5b <= 5'b00000;
                endcase
                // $display("[decoder___11]par_en=%0h,data_in=%0h,temp5b=%0h,temp3b=%0h",par_en,data_in,temp_5b,temp_3b);
            end
        //  join
            else 
            begin
            data_out <= {temp_3b,temp_5b};
            // $display("[decoder___22] data_in=%h,data_out=%h,temp_5b=%h,temp_3b=%h",data_in,data_out,temp_5b,temp_3b);
            end
        end
endmodule


// module decoder (
//     clk,
//     rst,
//     par_en,
//     data_out,
//     data_in
// );
//   input clk, rst;
//   input [9:0] data_in;
//   input par_en;
//   output reg [7:0] data_out;
//   reg [5:0] temp1;
//   reg [3:0] temp2;


//   always @(*) begin

//     if (rst == 1'b1)
//     data_out <= 8'b00000000;
//     else 
//     begin
      
//       temp1 <= data_in[9:4];
//       temp2 <= data_in[3:0];

//       if (par_en) begin

//         if (temp1 == 6'b100111 | temp1 == 6'b011000) data_out[4:0] <= 5'b00000;
//         else if (temp1 == 6'b011101 | temp1 == 6'b100010) data_out[4:0] <= 5'b00001;
//         else if (temp1 == 6'b101101 | temp1 == 6'b010010) data_out[4:0] <= 5'b00010;
//         else if (temp1 == 6'b110001) data_out[4:0] <= 5'b00011;


//         else if (temp1 == 6'b110101 | temp1 == 6'b001010) data_out[4:0] <= 5'b00100;
//         else if (temp1 == 6'b101001) data_out[4:0] <= 5'b00101;
//         else if (temp1 == 6'b011001) data_out[4:0] <= 5'b00110;
//         else if (temp1 == 6'b111000 | temp1 == 6'b000111) data_out[4:0] <= 5'b00111;


//         else if (temp1 == 6'b111001 | temp1 == 6'b000110) data_out[4:0] <= 5'b01000;
//         else if (temp1 == 6'b100101) data_out[4:0] <= 5'b01001;
//         else if (temp1 == 6'b010101) data_out[4:0] <= 5'b01010;
//         else if (temp1 == 6'b110100) data_out[4:0] <= 5'b01011;


//         else if (temp1 == 6'b001101) data_out[4:0] <= 5'b01100;
//         else if (temp1 == 6'b101100) data_out[4:0] <= 5'b01101;
//         else if (temp1 == 6'b011100) data_out[4:0] <= 5'b01110;
//         else if (temp1 == 6'b010111 | temp1 == 6'b101000) data_out[4:0] <= 5'b01111;


//         else if (temp1 == 6'b011011 | temp1 == 6'b100100) data_out[4:0] <= 5'b10000;
//         else if (temp1 == 6'b100011) data_out[4:0] <= 5'b10001;
//         else if (temp1 == 6'b010011) data_out[4:0] <= 5'b10010;
//         else if (temp1 == 6'b110010) data_out[4:0] <= 5'b10011;

//         else if (temp1 == 6'b001011) data_out[4:0] <= 5'b10100;
//         else if (temp1 == 6'b101010) data_out[4:0] <= 5'b10101;
//         else if (temp1 == 6'b011010) data_out[4:0] <= 5'b10110;
//         else if (temp1 == 6'b111010 | temp1 == 6'b000101) data_out[4:0] <= 5'b10111;


//         else if (temp1 == 6'b110011 | temp1 == 6'b001100) data_out[4:0] <= 5'b11000;
//         else if (temp1 == 6'b100110) data_out[4:0] <= 5'b11001;
//         else if (temp1 == 6'b010110) data_out[4:0] <= 5'b11010;
//         else if (temp1 == 6'b110110 | temp1 == 6'b001001) data_out[4:0] <= 5'b11011;

//         else if (temp1 == 6'b001110) data_out[4:0] <= 5'b11100;
//         else if (temp1 == 6'b101110 | temp1 == 6'b010001) data_out[4:0] <= 5'b11101;
//         else if (temp1 == 6'b011110 | temp1 == 6'b100001) data_out[4:0] <= 5'b11110;
//         else if (temp1 == 6'b101011 | temp1 == 6'b010100) data_out[4:0] <= 5'b11111;

//       end 
//       else
//        begin

//         if (temp1 == 6'b001111 | temp1 == 6'b110000) data_out[4:0] <= 5'b11100;
//         else if (temp1 == 6'b111010 | temp1 == 6'b000101) data_out[4:0] <= 5'b10111;
//         else if (temp1 == 6'b110110 | temp1 == 6'b001001) data_out[4:0] <= 5'b11011;
//         else if (temp1 == 6'b101110 | temp1 == 6'b010001) data_out[4:0] <= 5'b11101;
//         else if (temp1 == 6'b011110 | temp1 == 6'b100001) data_out[4:0] <= 5'b11110;

//       end
//     end

//   end

//   always @(temp2) begin


//     if (par_en) begin

//       if (temp2 == 4'b1011 | temp2 == 4'b0100) data_out[7:5] <= 3'b000;
//       else if (temp2 == 4'b1001) data_out[7:5] <= 3'b001;
//       else if (temp2 == 4'b0101) data_out[7:5] <= 3'b010;
//       else if (temp2 == 4'b1100 | temp2 == 4'b0011) data_out[7:5] <= 3'b011;
//       else if (temp2 == 4'b1101 | temp2 == 4'b0010) data_out[7:5] <= 3'b100;
//       else if (temp2 == 4'b1010) data_out[7:5] <= 3'b101;
//       else if (temp2 == 4'b0110) data_out[7:5] <= 3'b110;
//       else if (temp2 == 4'b1110 | temp2 == 4'b0001) data_out[7:5] <= 3'b111;
 
//     end 
    
//     else 
//     begin

//       if (temp2 == 4'b1011 | temp2 == 4'b0100) data_out[7:5] <= 3'b000;
//       else if (temp2 == 4'b0110 | temp2 == 4'b1001) data_out[7:5] <= 3'b001;
//       else if (temp2 == 4'b1010 | temp2 == 4'b0101) data_out[7:5] <= 3'b010;
//       else if (temp2 == 4'b1100 | temp2 == 4'b0011) data_out[7:5] <= 3'b011;
//       else if (temp2 == 4'b1101 | temp2 == 4'b0010) data_out[7:5] <= 3'b100;
//       else if (temp2 == 4'b0101 | temp2 == 4'b1010) data_out[7:5] <= 3'b101;
//       else if (temp2 == 4'b1001 | temp2 == 4'b0110) data_out[7:5] <= 3'b110;
//       else if (temp2 == 4'b0111 | temp2 == 4'b1000) data_out[7:5] <= 3'b111;

//     end
//   end

// endmodule
