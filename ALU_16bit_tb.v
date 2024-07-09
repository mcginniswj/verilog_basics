`timescale 1ns / 1ps

module ALU_16bit_tb;

  reg [15:0] A;
  reg [15:0] B;
  reg [2:0] opcode;

  wire [15:0] result;
  wire zero;

  ALU_16bit uut (
    .A(A), 
    .B(B), 
    .opcode(opcode), 
    .result(result), 
    .zero(zero)
  );

  initial begin
    A = 0;
    B = 0;
    opcode = 0;

    #20;
        
    // Test case 1: A + B
    A = 16'd10;
    B = 16'd5;
    opcode = 3'b000;  // Add
    #10;
    $display("A = %d, B = %d, opcode = %b, result = %d, zero = %b", A, B, opcode, result, zero);
    
    // Test case 2: A - B
    A = 16'd20;
    B = 16'd15;
    opcode = 3'b001;  // Subtract
    #10;
    $display("A = %d, B = %d, opcode = %b, result = %d, zero = %b", A, B, opcode, result, zero);
    
    // Test case 3: A & B
    A = 16'b1010101010101010;
    B = 16'b1100110011001100;
    opcode = 3'b010;  // AND
    #10;
    $display("A = %b, B = %b, opcode = %b, result = %b, zero = %b", A, B, opcode, result, zero);
    
    // Test case 4: A | B
    A = 16'b1010101010101010;
    B = 16'b1100110011001100;
    opcode = 3'b011;  // OR
    #10;
    $display("A = %b, B = %b, opcode = %b, result = %b, zero = %b", A, B, opcode, result, zero);
    
    // Test case 5: A < B
    A = 16'd10;
    B = 16'd20;
    opcode = 3'b100;  // Less than
    #10;
    $display("A = %d, B = %d, opcode = %b, result = %d, zero = %b", A, B, opcode, result, zero);
    
    // Test case 6: Default case
    A = 16'd5;
    B = 16'd5;
    opcode = 3'b101;  // Undefined opcode
    #10;
    $display("A = %d, B = %d, opcode = %b, result = %d, zero = %b", A, B, opcode, result, zero);
    
    // Test case 7: Zero result
    A = 16'd10;
    B = 16'd10;
    opcode = 3'b001;  // Subtract
    #10;
    $display("A = %d, B = %d, opcode = %b, result = %d, zero = %b", A, B, opcode, result, zero);

    $finish;
  end
endmodule
