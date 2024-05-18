`timescale 1ns / 1ps

module half_sub (
    input a, b,
    output D, Bout
);
    xor x1 (D, a, b);
    and a1 (Bout, ~a, b);

endmodule