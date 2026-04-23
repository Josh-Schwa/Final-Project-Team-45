module en_load_mux(
    input Q,
    input D,
    input en,
    input load,
    input load_value,
    output Y
    );
    
    assign Y = load ? load_value : (en ? D : Q);

endmodule
