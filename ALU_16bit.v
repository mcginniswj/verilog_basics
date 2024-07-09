`timescale 1ns / 1ps

module ALU_16bit(       
      input          [15:0]     A,           
      input          [15:0]     B,           
      input          [2:0]     opcode,       
      output     reg     [15:0]     result,                 
      output zero  
   );  
 always @(*)  
 begin   
      case(opcode)  
      3'b000: result = A + B; 
      3'b001: result = A - B;   
      3'b010: result = A & B;   
      3'b011: result = A | B;  
      3'b100: result =(A < B) ? 1'b1: 1'b0;  
      default:result = 1'b0;   
      endcase  
 end  
 assign zero = (result==16'd0) ? 1'b1: 1'b0;  
 endmodule  