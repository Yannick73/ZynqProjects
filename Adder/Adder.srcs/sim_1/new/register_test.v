`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2024 05:46:07 PM
// Design Name: 
// Module Name: register_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module register_test;
    // assertion task
    task assert(input condition);
        if(!condition)
        begin
            $display("ASSERTION FAILED");
            $finish;
        end
    endtask
    
    // I/O
    reg [7:0]data = 0;
    reg clk = 0;
    wire [7:0]out;
    
    // init uut
    byte_register register(
        .D(data),
        .c(clk),
        .Q(out)    
    );
    
    // test-sequence
    
    integer n = 0;
    
    initial
    begin
    
        data = 0;
        clk = 0;
        
        for (n=0; n<256; n=n+1)
        begin
            // set data to test-state
            # 1 data = n;
            // cycle clock
            # 1 clk = 1;
            # 1 clk = 0;
            // check the output
            assert(out==data);
        end
        
        $display("register_test finished w/o errors");
    end
endmodule