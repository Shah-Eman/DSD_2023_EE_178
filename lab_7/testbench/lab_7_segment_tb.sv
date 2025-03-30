`timescale 1ns / 1ps

module lab7_tb;
    
    logic [2:0] sel;
    logic [3:0] num;
    logic clk, reset, write;
    logic [6:0] seg;
    logic [7:0] anode;
    
    lab7 uut (
        .sel(sel),
        .num(num),
        .clk(clk),
        .reset(reset),
        .write(write),
        .seg(seg),
        .an(anode)
    );
    
    initial begin 
        clk = 0;
        forever #5 clk = ~clk; // Generate clock with 10ns period
    end
    
    initial begin
            write = 0;
            reset = 1;
            sel = 3'b000;
            num = 4'b0000;
            #10 reset = 0;
        end

        initial begin
            #50 write = 1;
            #50 write = 0;
            #50 write = 1;
            #50 write = 0;
        end

    
    task write_data(input [2:0] t_sel, input [3:0] t_num);
        begin
            sel = t_sel;
            num = t_num;
            #10;
        end
    endtask
    
    task driver(input [2:0] t_sel = $random, input [3:0] t_num = $random); 
        begin
            sel = t_sel;
            num = t_num;
            #10;
        end
    endtask
        
    task random_test(input int n);
        for(int i=0 ; i<n ; i++)
        begin
            driver();
        end
    endtask
        
    initial begin 
        random_test(50);
        #200;
        $finish;
    end
endmodule
