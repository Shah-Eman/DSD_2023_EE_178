`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////      
// University: UET, Lahore                                                              
// Engineer: Shah Eman                                                                  
//                                                                                      
// Design Name: LAB 4(Tri Color LED)                                                    
// Target Devices: Nexys A7-100T                                                        
//////////////////////////////////////////////////////////////////////////////////      
                                                                                       
module lab_4tb;

    logic [1:0] a;
    logic [1:0] b;
    
  
    logic R, G, B;
    
    
    lab_4 uut (
        .a(a),
        .b(b),
        .R(R),
        .G(G),
        .B(B)
    );

    
    logic exp_red, exp_green, exp_blue;

    
    task check_output();
            if ((R === exp_red) && (G === exp_green) && (B === exp_blue))
                $display("PASS | a=%b b=%b | R=%b G=%b B=%b | Expected: R=%b G=%b B=%b", a, b, R, G, B, exp_red, exp_green, exp_blue);
            else
                $display("FAIL | a=%b b=%b | R=%b G=%b B=%b | Expected: R=%b G=%b B=%b", a, b, R, G, B, exp_red, exp_green, exp_blue);
        endtask

    initial begin
    $display("a1 a0  b1 b0  |  R  G  B  |  Exp_R Exp_G Exp_B  |  Result");
    $display("------------------------------------------------------------");

    for (int i = 0; i < 4; i++) begin
        for (int j = 0; j < 4; j++) begin
            a = i; 
            b = j;

            
            exp_red   = (a[1]&a[0]) | (~b[1]&~b[0]) | (~b[1]&a[1]) | (~b[0]&a[1]) | (~b[1]&a[0]);
            exp_green = (b[1]&b[0]) | (~a[1]&~a[0]) | (b[1]&~a[0]) | (b[0]&~a[1]) | (b[1]&~a[1]);
            exp_blue  = (~b[0] & a[0]) | (b[0] & ~a[0]) | (b[1] & ~a[1]) | (~b[1] & a[1]);

            

            #10;

            check_output();
        end
    end

    $display("Testbench completed.");
    $finish;
end
endmodule
