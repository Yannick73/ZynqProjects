`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2024 04:49:10 PM
// Design Name: 
// Module Name: byte_register
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Positive Edge triggered 8-bit register
// 
//////////////////////////////////////////////////////////////////////////////////


module byte_register(
    input [7:0] D,
    input c,
    output reg [7:0] Q
    );
    
    initial begin
        Q = 0;
    end
    
    always@(posedge c)
    begin
        Q = D;
    end
endmodule
