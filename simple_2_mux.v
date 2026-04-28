module simple_2_mux(
    input A, B, en,
    output Y
    );
    
    assign Y = (A & ~en | B & en);
    
endmodule
