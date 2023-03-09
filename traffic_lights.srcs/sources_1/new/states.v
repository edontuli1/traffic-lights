`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2023 06:21:58 PM
// Design Name: 
// Module Name: states
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


module states(
    input clk,
    input [3:0] state,
    output reg [7:0] led
    );
    
    //LEDs status on each state
    always @(state)
    begin
    case(state)
    3'b000: led = 8'b10010001;      //tl1 "green", ped "wait", tl2 "red"
    3'b001: led = 8'b10010010;      //tl1 "orange", ped "wait", tl2 "red"
    3'b010: led = 8'b00110100;      //tl1 "red", ped "wait", tl2 "green"
    3'b011: led = 8'b01010100;      //tl1 "red", ped "wait", tl2 "orange"
    3'b100: led = 8'b10001100;      //tl1 "red", ped "walk", tl2 "red"
    endcase
    end
    
endmodule
