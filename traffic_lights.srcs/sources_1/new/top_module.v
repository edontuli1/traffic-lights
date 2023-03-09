`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2023 05:20:12 PM
// Design Name: 
// Module Name: top_module
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


module top_module(
    output [7:0] led,   //LEDs
    output [6:0] seg,   //7bits of each digit display
    output [3:0] an,    //4 digit 7segment display
    input clk,          //input clock of board (100MHz)
    input reset         //ped button
    );
    
    wire [2:0] state;   //state of traffic lights
    wire clk_out;       //slow clk (1Hz)
    
    traffic_lights L1(clk_out, reset, state, seg);
    states L2(clk_out, state, led);
    slow_clock L3(clk, clk_out); 
    decoder L4(state, an);
    
endmodule
