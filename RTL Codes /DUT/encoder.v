module encoder(
    input           clk,
    input           rst,
    input [7:0]     data_in,
    input           k_pin,
    output reg [9:0]    data_out
);


    reg [3:0]       temp_4b;
    reg [5:0]       temp_6b;

    always @ (posedge clk) begin
        if (rst) begin
            temp_4b <= 4'b0000;
            temp_6b <= 6'b000000;
        end
     
        else if (k_pin == 1 && rst == 0) 
            //  fork
            begin
                case (data_in[7:5])
                3'b000: temp_4b <= 4'b0100;
                3'b001: temp_4b <= 4'b1001;
                3'b010: temp_4b <= 4'b0101;
                3'b011: temp_4b <= 4'b0011;
                3'b100: temp_4b <= 4'b0010;
                3'b101: temp_4b <= 4'b1010;
                3'b110: temp_4b <= 4'b0110;
                3'b111: temp_4b <= 4'b0001;
                default: temp_4b <= 4'b0000;    
                endcase
                case (data_in[4:0])
                5'b00000: temp_6b <= 6'b011000;

                5'b00001: temp_6b <= 6'b011101;
                5'b00010: temp_6b <= 6'b010010;     
                5'b00011: temp_6b <= 6'b110001;
                5'b00100: temp_6b <= 6'b110101;
                5'b00101: temp_6b <= 6'b101001;
                5'b00110: temp_6b <= 6'b011001;
                5'b00111: temp_6b <= 6'b111000;
                5'b01000: temp_6b <= 6'b111001;
                5'b01001: temp_6b <= 6'b100101;
                5'b01010: temp_6b <= 6'b010101;
                5'b01011: temp_6b <= 6'b110100;
                5'b01100: temp_6b <= 6'b001101;
                5'b01101: temp_6b <= 6'b101100;
                5'b01110: temp_6b <= 6'b011100;
                5'b01111: temp_6b <= 6'b010111;
                5'b10000: temp_6b <= 6'b011011;
                5'b10001: temp_6b <= 6'b100011;
                5'b10010: temp_6b <= 6'b010011;
                5'b10011: temp_6b <= 6'b110010;
                5'b10100: temp_6b <= 6'b001011;
                5'b10101: temp_6b <= 6'b101010;
                5'b10110: temp_6b <= 6'b011010;
                5'b10111: temp_6b <= 6'b111010;
                5'b11000: temp_6b <= 6'b110011;
                5'b11001: temp_6b <= 6'b100110;
                5'b11010: temp_6b <= 6'b010110;
                5'b11011: temp_6b <= 6'b110110;
                5'b11100: temp_6b <= 6'b001110;
                5'b11101: temp_6b <= 6'b101110;
                5'b11110: temp_6b <= 6'b011110;
                5'b11111: temp_6b <= 6'b101011;
                default: temp_6b <= 6'b000000;
                endcase 
            end
    //  join
            else data_out <= {temp_4b, temp_6b};
            // $display("data_in=%h,data_out=%h,temp_4b=%h,temp_6b=%h",data_in,data_out,temp_4b,temp_6b);
        end

endmodule



// module encoder (
//     clk,
//     rst,
//     data_in,
//     k_pin,
//     data_out
// );     

//   input clk, rst;
//   input k_pin;

//   input [7:0] data_in;
//  reg signed [3:0] disp_error;
//   reg positive_disp;
//   reg negative_disp;
//   // reg neutral_disp;
//   output reg [9:0] data_out;
//   reg [3:0] count1;
//   reg [3:0] count0;
//   reg [7:3] temp1;
//   reg [2:0] temp2;

//   integer i = 0;
//   //always@(*)
//   always @(rst or data_in) begin

//     if (rst == 1'b1) begin
//       data_out = 10'b0000000000;
//     end else begin
//       count1 = 3'b000;
//       count0 = 3'b000;
//       for (i = 0; i <= 7; i = i + 1) begin
//         if (data_in[i] == 1) count1 = count1 + 1;
//         else count0 = count0 + 1;
//       end
//       temp1[7:3] = data_in[4:0];
//       temp2[2:0] = data_in[7:5];

//       disp_error = count1 - count0;


//       if (count1 > count0) begin
//         positive_disp = 1;
//         negative_disp = 0;
//         // neutral_disp  = 0;
//       end else if (count1 < count0) begin
//         positive_disp = 0;
//         negative_disp = 1;
//         // neutral_disp  = 0;
//       end 

//     end

//   end

//   always @(disp_error) begin
//     if(k_pin)   //data
// 	begin

//       //5B/6B ENCODER	

//       case (temp1)
//         5'b00000:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b100111;
//         end else data_out[9:4] <= 6'b011000;
//         5'b00001:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b011101;
//         end else data_out[9:4] <= 6'b100010;
//         5'b00010:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b101101;
//         end else data_out[9:4] <= 6'b010010;
//         5'b00011:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b110001;
//         end else data_out[9:4] <= 6'b110001;
//         5'b00100:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b110101;
//         end else data_out[9:4] <= 6'b001010;
//         5'b00101:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b101001;
//         end else data_out[9:4] <= 6'b101001;
//         5'b00110:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b011001;
//         end else data_out[9:4] <= 6'b011001;
//         5'b00111:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b111000;
//         end else data_out[9:4] <= 6'b000111;
//         5'b01000:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b111001;
//         end else data_out[9:4] <= 6'b111001;
//         5'b01001:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b100101;
//         end else data_out[9:4] <= 6'b100101;
//         5'b01010:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b010101;
//         end else data_out[9:4] <= 6'b010101;
//         5'b01011:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b110100;
//         end else data_out[9:4] <= 6'b110100;
//         5'b01100:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b001101;
//         end else data_out[9:4] <= 6'b001101;
//         5'b01101:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b101100;
//         end else data_out[9:4] <= 6'b101100;
//         5'b01110:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b011100;
//         end else data_out[9:4] <= 6'b011100;
//         5'b01111:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b010111;
//         end else data_out[9:4] <= 6'b101000;
//         5'b10000:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b011011;
//         end else data_out[9:4] <= 6'b100100;
//         5'b10001:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b100011;
//         end else data_out[9:4] <= 6'b100011;
//         5'b10010:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b010011;
//         end else data_out[9:4] <= 6'b010011;
//         5'b10011:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b110010;
//         end else data_out[9:4] <= 6'b110010;
//         5'b10100:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b001011;
//         end else data_out[9:4] <= 6'b001011;
//         5'b10101:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b101010;
//         end else data_out[9:4] <= 6'b101010;
//         5'b10110:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b011010;
//         end else data_out[9:4] <= 6'b011010;
//         5'b10111:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b111010;
//         end else data_out[9:4] <= 6'b111010;
//         5'b11000:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b110011;
//         end else data_out[9:4] <= 6'b001100;
//         5'b11001:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b100110;
//         end else data_out[9:4] <= 6'b100110;
//         5'b11010:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b010110;
//         end else data_out[9:4] <= 6'b010110;
//         5'b11011:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b110110;
//         end else data_out[9:4] <= 6'b001001;
//         5'b11100:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b001110;
//         end else data_out[9:4] <= 6'b001110;
//         5'b11101:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b101110;
//         end else data_out[9:4] <= 6'b010001;
//         5'b11110:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b011110;
//         end else data_out[9:4] <= 6'b100001;
//         5'b11111:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b101011;
//         end else data_out[9:4] <= 6'b010100;
//         default: data_out[9:4] <= 6'bxxxxxx;
//       endcase


//       //3B/4B ENCODER

//       case (temp2)

//         3'b000:
//         if (disp_error < 0) begin
//           data_out[3:0] <= 4'b1011;
//         end else data_out[3:0] <= 4'b0100;
//         3'b001:
//         if (disp_error < 0) begin
//           data_out[3:0] <= 4'b1001;
//         end else data_out[3:0] <= 4'b1001;
//         3'b010:
//         if (disp_error < 0) begin
//           data_out[3:0] <= 4'b0101;
//         end else data_out[3:0] <= 4'b0101;
//         3'b011:
//         if (disp_error < 0) begin
//           data_out[3:0] <= 4'b1100;
//         end else data_out[3:0] <= 4'b0011;
//         3'b100:
//         if (disp_error < 0) begin
//           data_out[3:0] <= 4'b1101;
//         end else data_out[3:0] <= 4'b0010;
//         3'b101:
//         if (disp_error < 0) begin
//           data_out[3:0] <= 4'b1010;
//         end else data_out[3:0] <= 4'b1010;
//         3'b110:
//         if (disp_error < 0) begin
//           data_out[3:0] <= 4'b0110;
//         end else data_out[3:0] <= 4'b0110;
//         3'b111:
//         if (disp_error < 0) begin
//           data_out[3:0] <= 4'b1110;
//         end   //4'b0111
// 		else data_out[3:0] <= 4'b0001;  ///4'b1000
//         default: data_out[3:0] <= 4'bxxxx;
//       endcase


//     end 
    
//     else  //control   //5B/6B ENCODER
//     begin
//       case (temp1)
//         5'b11100:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b001111;
//         end else data_out[9:4] <= 6'b110000;
//         5'b10111:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b111010;
//         end else data_out[9:4] <= 6'b000101;
//         5'b11011:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b110110;
//         end else data_out[9:4] <= 6'b001001;
//         5'b11101:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b101110;
//         end else data_out[9:4] <= 6'b010001;
//         5'b11110:
//         if (disp_error < 0) begin
//           data_out[9:4] <= 6'b011110;
//         end else data_out[9:4] <= 6'b100001;
//         default: data_out[9:4] <= 6'bxxxxxx;
//       endcase


//       //3B/4B ENCODER

//       case (temp2)
//         3'b000:
//         if (disp_error < 0) begin
//           data_out[3:0] <= 4'b1011;
//         end else data_out[3:0] <= 4'b0100;
//         3'b001:
//         if (disp_error < 0) begin
//           data_out[3:0] <= 4'b0110;
//         end else data_out[3:0] <= 4'b1001;
//         3'b010:
//         if (disp_error < 0) begin
//           data_out[3:0] <= 4'b1010;
//         end else data_out[3:0] <= 4'b0101;
//         3'b011:
//         if (disp_error < 0) begin
//           data_out[3:0] <= 4'b1100;
//         end else data_out[3:0] <= 4'b0011;
//         3'b100:
//         if (disp_error < 0) begin
//           data_out[3:0] <= 4'b1101;
//         end else data_out[3:0] <= 4'b0010;
//         3'b101:
//         if (disp_error < 0) begin
//           data_out[3:0] <= 4'b0101;
//         end else data_out[3:0] <= 4'b1010;
//         3'b110:
//         if (disp_error < 0) begin
//           data_out[3:0] <= 4'b1001;
//         end else data_out[3:0] <= 4'b0110;
//         3'b111:
//         if (disp_error < 0) begin
//           data_out[3:0] <= 4'b0111;
//         end else data_out[3:0] <= 4'b1000;
//         default: data_out[3:0] <= 4'bxxxx;
//       endcase

//     end
//   end
// endmodule
