//StopWatch: Modulo-60 Counter
module stopwatch(
    input clk,
    input rst,
    input en,
    output [5:0] state     //6-bits to represent the highest number 59
);
    
wire w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22;

// bit 0 (LSB)
full_adder fa_zero(
    .A(w0),
    .B(1'b1),
    .Cin(1'b0),
    .Cout(w12),
    .sum(w6)
);

// bit 1
full_adder fa_one(
    .A(w1),
    .B('b0),
    .Cin(w12),
    .Cout(w13),
    .sum(w7)
);

// bit 2
full_adder fa_two(
    .A(w2),
    .B('b0),
    .Cin(w13),
    .Cout(w14),
    .sum(w8)
);

// bit 3
full_adder fa_three(
    .A(w3),
    .B('b0),
    .Cin(w14),
    .Cout(w15),
    .sum(w9)
);

// bit 4
full_adder fa_four(
    .A(w4),
    .B('b0),
    .Cin(w15),
    .Cout(w16),
    .sum(w10)
);

// bit 5 (MSB)
full_adder fa_five(
    .A(w5),
    .B('b0),
    .Cin(w16),
    .sum(w11)
);

simple_2_mux mux1(
    .A(w0),
    .B(w6),
    .en(en),
    .Y(w17)
);

simple_2_mux mux2(
    .A(w1),
    .B(w7),
    .en(en),
    .Y(w18)
);

simple_2_mux mux3(
    .A(w2),
    .B(w8),
    .en(en),
    .Y(w19)
);

simple_2_mux mux4(
    .A(w3),
    .B(w9),
    .en(en),
    .Y(w20)
);

simple_2_mux mux5(
    .A(w4),
    .B(w10),
    .en(en),
    .Y(w21)
);

simple_2_mux mux6(
    .A(w5),
    .B(w11),
    .en(en),
    .Y(w22)
);
   
D_flip_flop D_flip_flop_one(
    .D(w17),
    .clock(clk),
    .Q(w0),
    .reset(dreset)
);

D_flip_flop D_flip_flop_two(
    .D(w18),
    .clock(clk),
    .Q(w1),
    .reset(dreset)
);

D_flip_flop D_flip_flop_three(
    .D(w19),
    .clock(clk),
    .Q(w2),
    .reset(dreset)
);

D_flip_flop D_flip_flop_four(
    .D(w20),
    .clock(clk),
    .Q(w3),
    .reset(dreset)
);

D_flip_flop D_flip_flop_five(
    .D(w21),
    .clock(clk),
    .Q(w4),
    .reset(dreset)
);

D_flip_flop D_flip_flop_six(
    .D(w22),
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

assign hitpoint = state[5] & state[4] & state[3] & state[2] & ~state[1] & ~state[0];
assign dreset = hitpoint | rst;
assign qout = hitpoint ^ out;

D_flip_flop dff_inst(
    .D(qout),
    .clock(clk),
    .reset(rst),
    .Q(out)
);
    
endmodule




