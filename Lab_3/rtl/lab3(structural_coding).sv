`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: UET, Lahore 
// Engineer: Shah Eman
// 
// Design Name: LAB 3
// Target Devices: Nexys A7-100T
//////////////////////////////////////////////////////////////////////////////////

module lab3(
    output logic x, y,  
    input logic a, b, c
); 

    // Internal wires for gate-level connections
    logic not_c, or_ab, xor1_out, and1_out, xor2_out, not_and_out;

    // Structural modeling using gate primitives

    // NOT gate for ~c
    not (not_c, c); 
    
    // OR gate for (a | b)
    or (or_ab, a, b);

    // XOR gate for (a | b) ^ ~c
    xor (xor1_out, or_ab, not_c);
    
    // Output x
    assign x = xor1_out;

    // AND gate for (a & b)
    and (and1_out, a, b);

    // NOT gate for ~(a & b)
    not (not_and_out, and1_out);

    // XOR gate for ~(a & b) ^ (a | b)
    xor (xor2_out, not_and_out, or_ab);

    // AND gate for (a | b) & result of XOR2
    and (y, or_ab, xor2_out);

endmodule
