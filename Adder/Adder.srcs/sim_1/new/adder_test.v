`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2024 07:09:42 PM
// Design Name: 
// Module Name: adder_test
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


module adder_test;

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
    reg ca = 0;
    reg cb = 0;
    reg clk = 0;
    wire [7:0]sum;
    wire carry;
    
    // init uut
    Adder adder(
        .data(data),
        .CA(ca),
        .CB(cb),
        .clk_100MHz(clk),
        .S(sum),
        .carry(carry)    
    );
    
    // test-sequence
    
    integer a = 0;
    integer b = 0;
    
    integer sum_in = 0;
    integer sum_out = 0;
    
    parameter integer bittednes = 8;
    parameter integer upper_lim = 1 << bittednes;
    
    // setup adder clock to run quick
    initial clk = 0;
    always #0.1 clk = ~clk;
    
    // then try all different sums
    initial
    begin
    
        data = 0;
        ca = 0;
        cb = 0;
        
        for (a=0; a<upper_lim; a=a+1)
        begin
            for (b=0; b<upper_lim; b=b+1)
            begin
                // set data to a and save into reg a
                # 1 data = a;
                # 1 ca = 1;
                # 1 ca = 0;
                // then same with b
                # 1 data = b;
                # 1 cb = 1;
                # 1 cb = 0;
                // finally assert, that a+b = sum with carry
                sum_in = a+b;
                sum_out = (carry<<8)+sum;
                assert(sum_in==sum_out);
                # 1;
                            
            end
        end
        
        // set a and b to upper_lim, as to not confuse in the wave diagram
        a = upper_lim;
        b = upper_lim;        
        $display("adder_test finished w/o errors!");
        $finish;
    end
endmodule
