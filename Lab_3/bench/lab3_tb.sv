`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: UET, Lahore 
// Engineer: Shah Eman
// 
// Design Name: LAB 3
// Target Devices: Nexys A7-100T
//////////////////////////////////////////////////////////////////////////////////
module lab3_tb;
    reg a, b, c;
    wire x, y;
    lab3 uut (
        .a(a), .b(b), .c(c), 
        .x(x), .y(y)
    );
    
    initial begin
        for (int i = 0; i < 8; i++) begin
            {a,b,c} = i; 
            #10; 
            
        end
        $finish;
    end
endmodule
