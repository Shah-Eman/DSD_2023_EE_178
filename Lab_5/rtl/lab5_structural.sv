`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////                   
// University: UET, Lahore                                                                           
// Engineer: Shah Eman                                                                               
//                                                                                                   
// Design Name: LAB 5(Seven Segment Display)                                                                 
// Target Devices: Nexys A7-100T                                                                     
//////////////////////////////////////////////////////////////////////////////////  

module lab5_structural(
  input [3:0] num,  
  input [2:0] sel,  
  output logic [6:0] seg,  
  output logic [7:0] an   
);

  logic a, b, c, d;
  
  assign a = num[3];  
  assign b = num[2];
  assign c = num[1];
  assign d = num[0];

  always_comb begin
    seg[0] = (~a & ~b & ~c & d) | (~a & b & ~c & ~d) | (a & b & ~c & d) | (a & ~b & c & d);
    seg[1] = (b & c & ~d) | (a & c & d) | (a & b & ~d) | (~a & b & ~c & d);
    seg[2] = (a & b & ~d) | (a & b & c) | (~a & ~b & c & ~d);
    seg[3] = (b & c & d) | (~a & ~b & ~c & d) | (~a & b & ~c & ~d) | (a & ~b & c & ~d);
    seg[4] = (~a & d) | (~b & ~c & d) | (~a & b & ~c);
    seg[5] = (~a & ~b & d) | (~a & ~b & c) | (~a & c & d) | (a & b & ~c & d);
    seg[6] = (~a & ~b & ~c) | (~a & b & c & d) | (a & b & ~c & ~d);
  
    an[0] = sel[2] | sel[1] | sel[0];
    an[1] = sel[2] | sel[1] | ~sel[0];
    an[2] = sel[2] | ~sel[1] | sel[0];
    an[3] = sel[2] | ~sel[1] | ~sel[0];
    an[4] = ~sel[2] | sel[1] | sel[0];
    an[5] = ~sel[2] | sel[1] | ~sel[0];
    an[6] = ~sel[2] | ~sel[1] | sel[0];
    an[7] = ~sel[2] | ~sel[1] | ~sel[0];
  end
  
endmodule


