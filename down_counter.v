module down_counter(
    input [5:0] q,
    output D0, D1, D2, D3, D4, D5
    );
    
    assign D0 = ~q[0];
    assign D1 = q[1] ^ ~q[0];
    assign D2 = q[2] ^ (~q[1] & ~q[0]);
    assign D3 = q[3] ^ (~q[2] & ~q[1] & ~q[0]);
    assign D4 = q[4] ^ (~q[3] & ~q[2] & ~q[1] & ~q[0]);
    assign D5 = q[5] ^ (~q[4] & ~q[3] & ~q[2] & ~q[1] & ~q[0]);
    
endmodule
