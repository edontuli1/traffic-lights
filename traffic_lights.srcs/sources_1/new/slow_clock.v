`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2023 02:26:15 PM
// Design Name: 
// Module Name: Slow_Clock
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


module slow_clock(
    input clk_in,       //input clock which is 100MHz from the Basys 3 board
    output reg clk_out      //slow clock at 1Hz
    );
    
    reg [25:0] count=0;   //internal counter 2 power 26
    
    always @(posedge clk_in)    //whenever the positive edge of the clock arrives
        begin
            count <= count+1;   //counter goes up by 1
        if(count==49_999_999) //when counter reaches half clock cycle
        begin
            count <= 0;     //counter goes back to 0
            clk_out = ~clk_out; //clock signal should invert         
        end
    end
endmodule