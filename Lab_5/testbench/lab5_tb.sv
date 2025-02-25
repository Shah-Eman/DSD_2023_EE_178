`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////      
// University: UET, Lahore                                                              
// Engineer: Shah Eman                                                                  
//                                                                                      
// Design Name: LAB 5(Seven Segment Display)                                                  
// Target Devices: Nexys A7-100T                                                        
//////////////////////////////////////////////////////////////////////////////////      
                                                            

module lab5_tb();
s
    logic [3:0] num;        
    logic [2:0] sel;        
    logic [6:0] seg_beh, seg_str;  
    logic [7:0] an_beh, an_str;    

    int pass_count = 0, fail_count = 0;  

    lab5 uut_beh (
        .num(num),
        .sel(sel),
        .seg(seg_beh),
        .an(an_beh)
    );

    lab5_structural uut_str (
        .num(num),
        .sel(sel),
        .seg(seg_str),
        .an(an_str)
    );

    task apply_inputs(input logic [3:0] N, input logic [2:0] S);
        begin
            num = N;
            sel = S;
            #10;  
        end
    endtask

    task verify_output(logic [6:0] expected_seg, logic [7:0] expected_an);
        begin
            if ((seg_beh !== expected_seg) || (an_beh !== expected_an)) begin
                $display("ERROR (BEHAVIORAL): num=%b, sel=%b, Expected: seg=%b, an=%b, Got: seg=%b, an=%b", 
                         num, sel, expected_seg, expected_an, seg_beh, an_beh);
                fail_count++;
            end else begin
                $display("PASS (BEHAVIORAL): num=%b, sel=%b, seg=%b, an=%b", num, sel, seg_beh, an_beh);
                pass_count++;
            end    

            if ((seg_str !== expected_seg) || (an_str !== expected_an)) begin
                $display("ERROR (STRUCTURAL): num=%b, sel=%b, Expected: seg=%b, an=%b, Got: seg=%b, an=%b", 
                         num, sel, expected_seg, expected_an, seg_str, an_str);
                fail_count++;
            end else begin
                $display("PASS (STRUCTURAL): num=%b, sel=%b, seg=%b, an=%b", num, sel, seg_str, an_str);
                pass_count++;
            end    
        end
    endtask

    // Task: Compute Expected Values
    task compute_expected(output logic [6:0] expected_seg, output logic [7:0] expected_an);
        begin
            case (num)
                4'h0: expected_seg = 7'b1000000;
                4'h1: expected_seg = 7'b1111001;
                4'h2: expected_seg = 7'b0100100;
                4'h3: expected_seg = 7'b0110000;
                4'h4: expected_seg = 7'b0011001;
                4'h5: expected_seg = 7'b0010010;
                4'h6: expected_seg = 7'b0000010;
                4'h7: expected_seg = 7'b1111000;
                4'h8: expected_seg = 7'b0000000;
                4'h9: expected_seg = 7'b0010000;
                4'hA: expected_seg = 7'b0001000;
                4'hB: expected_seg = 7'b0000011;
                4'hC: expected_seg = 7'b1000110;
                4'hD: expected_seg = 7'b0100001;
                4'hE: expected_seg = 7'b0000110;
                4'hF: expected_seg = 7'b0001110;
                default: expected_seg = 7'b1111111;
            endcase

            case (sel)
                3'b000: expected_an = 8'b11111110;
                3'b001: expected_an = 8'b11111101;
                3'b010: expected_an = 8'b11111011;
                3'b011: expected_an = 8'b11110111;
                3'b100: expected_an = 8'b11101111;
                3'b101: expected_an = 8'b11011111;
                3'b110: expected_an = 8'b10111111;
                3'b111: expected_an = 8'b01111111;
                default: expected_an = 8'b11111111;
            endcase
        end
    endtask

    task run_test(input logic [3:0] N, input logic [2:0] S);
        logic [6:0] expected_seg;
        logic [7:0] expected_an;
        begin
            apply_inputs(N, S);
            compute_expected(expected_seg, expected_an);
            verify_output(expected_seg, expected_an);
        end
    endtask

    task run_all_tests();
        begin
            $display("\nStarting Self-Testing Testbench for LAB 5...\n");

         
            run_test(4'b0000, 3'b000);
            run_test(4'b1111, 3'b111);
            run_test(4'b1010, 3'b011);
            run_test(4'b0101, 3'b100);

            
            for (int i = 0; i < 5; i++) begin
                run_test($random % 16, $random % 8);
            end

            
            $display("\nTest Completed: %0d Passed, %0d Failed.", pass_count, fail_count);
            if (fail_count == 0) 
                $display("✅ All tests passed successfully!");
            else 
                $display("❌ Some tests failed. Please check the design.");

            $finish;
        end
    endtask

    initial begin
        run_all_tests();
    end

endmodule