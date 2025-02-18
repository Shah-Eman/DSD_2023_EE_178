`timescale 1ns / 1ps                                                                                 
//////////////////////////////////////////////////////////////////////////////////                   
// University: UET, Lahore                                                                           
// Engineer: Shah Eman                                                                               
//                                                                                                   
// Design Name: LAB 4(Tri Color LED)                                                                 
// Target Devices: Nexys A7-100T                                                                     
//////////////////////////////////////////////////////////////////////////////////                   
                                                                                                     
module lab_4(                                                                                        
    input logic [1:0] a,                                                                             
    input logic [1:0] b,                                                                             
    output logic R, G, B                                                                             
);                                                                                                   
                                                                                                     
assign R = (a[1]&a[0]) | (~b[1]&~b[0]) | (~b[1]&a[1]) | (~b[0]&a[1]) | (~b[1]&a[0]);                 
                                                                                                     
assign G = (b[1]&b[0]) | (~a[1]&~a[0]) | (b[1]&~a[0]) | (b[0]&~a[1]) | (b[1]&~a[1]);                 
                                                                                                     
assign B = (~b[0] & a[0]) | (b[0] & ~a[0]) | (b[1] & ~a[1]) | (~b[1] & a[1]);                        
                                                                                                     
endmodule                                                                                            
                                                                                                     
                                                                                                     
                                                                                                     
                                                                                                     
                                                                                                     