`timescale 1ns / 1ps

module full_adder(
    input a,b,cin,
    output sum, cout
    );
    
    wire x,y,z;
    
    half_adder ha1(.a(a), .b(b), .sum(x), .cout(y));
    half_adder ha2(.a(x), .b(cin), .sum(sum), .cout(z));
    or m1(cout, y, z);
endmodule