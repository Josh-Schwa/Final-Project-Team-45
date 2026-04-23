module D_flip_flop(
        input D,
        input clock,
        input reset,
        output reg Q,
        output notQ
    );
    
    initial begin
        Q <= 0;
    end
    
    always @(posedge clock, posedge reset)begin
        if(reset) Q <= 0;
        else
            Q <= D;
    end
    
    assign notQ = ~Q;
    
endmodule
