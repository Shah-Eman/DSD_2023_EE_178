module Lab3(
output x, y,  
    input a, b, c
   ); 
    
    assign x = ((a | b) ^ ~c) ;
    assign y = (a | b) & (~(a & b) ^ (a | b));
endmodule