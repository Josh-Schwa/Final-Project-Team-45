//Timer: Mod-60 downcounter with synchronous load
module timer(
    input clk,
    input rst,
    input en,               //Enables or Disables clock
    input load,             //If load=1, load the counter with "load_value"
    input [5:0] load_value, //Value to load into counter register. Counter will then start counting from this value
    output [5:0] state     //6-bits to represent the highest number 59
);

wire D0, D1, D2, D3, D4, D5;
wire Y5, Y4, Y3, Y2, Y1, Y0;
wire Q5, Q4, Q3, Q2, Q1, Q0;

// countdown values if selected
down_counter down_counter_inst(
    .q(state),
    .D0(D0),
    .D1(D1),
    .D2(D2),
    .D3(D3),
    .D4(D4),
    .D5(D5)
);

// check for zero
wire [5:0] D_vector = {D5, D4, D3, D2, D1, D0};
wire [5:0] D_number = (state == 6'd0) ? 6'd0 : D_vector;

// bit 5 (MSB)
en_load_mux enload_five(
    .Q(state[5]),
    .D(D_number[5]),
    .en(en),
    .load(load),
    .load_value(load_value[5]),
    .Y(Y5)
);

D_flip_flop dff_5(
    .D(Y5),
    .clock(clk),
    .reset(rst),
    .Q(Q5)
);

// bit 4
en_load_mux enload_four(
    .Q(state[4]),
    .D(D_number[4]),
    .en(en),
    .load(load),
    .load_value(load_value[4]),
    .Y(Y4)
);

D_flip_flop dff_4(
    .D(Y4),
    .clock(clk),
    .reset(rst),
    .Q(Q4)
);

// bit 3
en_load_mux enload_three(
    .Q(state[3]),
    .D(D_number[3]),
    .en(en),
    .load(load),
    .load_value(load_value[3]),
    .Y(Y3)
);

D_flip_flop dff_3(
    .D(Y3),
    .clock(clk),
    .reset(rst),
    .Q(Q3)
);

// bit 2
en_load_mux enload_two(
    .Q(state[2]),
    .D(D_number[2]),
    .en(en),
    .load(load),
    .load_value(load_value[2]),
    .Y(Y2)
);

D_flip_flop dff_2(
    .D(Y2),
    .clock(clk),
    .reset(rst),
    .Q(Q2)
);

// bit 1
en_load_mux enload_one(
    .Q(state[1]),
    .D(D_number[1]),
    .en(en),
    .load(load),
    .load_value(load_value[1]),
    .Y(Y1)
);

D_flip_flop dff_1(
    .D(Y1),
    .clock(clk),
    .reset(rst),
    .Q(Q1)
);

// bit 0 (LSB)
en_load_mux enload_zero(
    .Q(state[0]),
    .D(D_number[0]),
    .en(en),
    .load(load),
    .load_value(load_value[0]),
    .Y(Y0)
);

D_flip_flop dff_0(
    .D(Y0),
    .clock(clk),
    .reset(rst),
    .Q(Q0)
);


assign state[5] = Q5;
assign state[4] = Q4;
assign state[3] = Q3;
assign state[2] = Q2;
assign state[1] = Q1;
assign state[0] = Q0;

endmodule