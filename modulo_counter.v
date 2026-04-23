module modulo_counter(
    input clk,
    input reset,
    input enable,
    output out,
    output [5:0] state
    );
    
    wire w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16;
    
    full_adder fa_one(
        .A(w0),
        .B(1'b1),
        .Cin(1'b0),
        .Cout(w12),
        .sum(w6)
    );
    
    full_adder fa_two(
        .A(w1),
        .B('b0),
        .Cin(w12),
        .Cout(w13),
        .sum(w7)
    );
    
    full_adder fa_three(
        .A(w2),
        .B('b0),
        .Cin(w13),
        .Cout(w14),
        .sum(w14)
    );
    
    full_adder fa_four(
        .A(w3),
        .B('b0),
        .Cin(w14),
        .Cout(w15),
        .sum(w9)
    );
    
    full_adder fa_five(
        .A(w4),
        .B('b0),
        .Cin(w15),
        .Cout(w16),
        .sum(w10)
    );
    
    full_adder fa_six(
        .A(w5),
        .B('b0),
        .Cin(w16),
        .sum(w11)
    );
       
    D_flip_flop D_flip_flop_one(
        .D(enable & w6),
        .clock(clk),
        .Q(w0),
        .reset(dreset)
    );
    
    D_flip_flop D_flip_flop_two(
        .D(enable & w7),
        .clock(clk),
        .Q(w1),
        .reset(dreset)
    );
    
    D_flip_flop D_flip_flop_three(
        .D(enable & w8),
        .clock(clk),
        .Q(w2),
        .reset(dreset)
    );
    
    D_flip_flop D_flip_flop_four(
        .D(enable & w9),
        .clock(clk),
        .Q(w3),
        .reset(dreset)
    );
    
    D_flip_flop D_flip_flop_five(
        .D(enable & w10),
        .clock(clk),
        .Q(w4),
        .reset(dreset)
    );
    
    D_flip_flop D_flip_flop_six(
        .D(enable & w11),
        .clock(clk),
        .Q(w5),
        .reset(dreset)
    );
    
    assign state[0] = w0;
    assign state[1] = w1;
    assign state[2] = w2;
    assign state[3] = w3;
    assign state[4] = w4;
    assign state[5] = w5;
    
    assign hitpoint = state[0] & state[1] & state[2] & state [4] & state[5];
    assign dreset = hitpoint | reset;
    assign qout = hitpoint ^ out;
    
    D_flip_flop dff_inst(
        .D(qout),
        .clock(clk),
        .reset(reset),
        .Q(out)
    );
    
endmodule
