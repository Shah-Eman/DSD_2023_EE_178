`timescale 1ns / 1ps         
                                                                        
//////////////////////////////////////////////////////////////////////////////////                   
// University: UET, Lahore                                                                           
// Engineer: Shah Eman                                                                               
//                                                                                                   
// Design Name: LAB 5(Seven Segment Display)                                                                 
// Target Devices: Nexys A7-100T                                                                     
//////////////////////////////////////////////////////////////////////////////////                   
                                                                                                     
module lab5 (
    input  logic [3:0] num,      // Hexadecimal input (0-F)
    output logic [6:0] seg,       // Segments (A-G, active-low)
     input logic [2:0] sel,
     output logic [7:0] an
     
);
    always_comb begin
        case (num)
          4'h0: seg = 7'b1000000;  
             4'h1: seg = 7'b1111001;
             4'h2: seg = 7'b0100100;
             4'h3: seg = 7'b0110000;
             4'h4: seg = 7'b0011001;
             4'h5: seg = 7'b0010010;
             4'h6: seg = 7'b0000010;
             4'h7: seg = 7'b1111000;
             4'h8: seg = 7'b0000000;
             4'h9: seg = 7'b0010000;
             4'hA: seg = 7'b0001000;
             4'hB: seg = 7'b0000011;
             4'hC: seg = 7'b1000110;
             4'hD: seg = 7'b0100001;
             4'hE: seg = 7'b0000110;
             4'hF: seg = 7'b0001110;
             default: seg = 7'b1111111;
        endcase
    end
 always_comb begin
           an = 8'b11111111; // Default: All displays OFF
           case (sel)
               3'b000: an = 8'b11111110; // Select Display 0
               3'b001: an = 8'b11111101; // Select Display 1
               3'b010: an = 8'b11111011; // Select Display 2
               3'b011: an = 8'b11110111; // Select Display 3
               3'b100: an = 8'b11101111; // Select Display 4
               3'b101: an = 8'b11011111; // Select Display 5
               3'b110: an = 8'b10111111; // Select Display 6
               3'b111: an = 8'b01111111; // Select Display 7
               default: an = 8'b11111111; // All displays OFF
           endcase
       end
   
   endmodule
                                                                                      
                                                                                                     
                                                                                                     
                                                                                                     
                                                                                                     
                                                                                                     