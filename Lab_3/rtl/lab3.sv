`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: UET, Lahore 
// Engineer: Shah Eman
// 
// Design Name: LAB 3
// Target Devices: Nexys A7-100T
//////////////////////////////////////////////////////////////////////////////////

module lab3(
output x, y,  
    input a, b, c
   ); 
    
    assign x = ((a | b) ^ ~c) ;
    assign y = (a | b) & (~(a & b) ^ (a | b));
endmodule