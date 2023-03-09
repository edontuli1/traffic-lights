`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2023 04:11:46 PM
// Design Name: 
// Module Name: tf_tb
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


module tf_tb(

    );
    
    traffic_lights U0(clk, reset, state);
    
    reg clk, reset;
    reg [25:0] count;
    wire [1:0] state;
    
    always #5 count = ~count;
    always #100 clk = ~clk;
    always #200 reset = ~reset;
    
    initial begin 
        count = 5;
        reset = 1'b0;
        clk = 1'b0;
    end
    
    
endmodule
