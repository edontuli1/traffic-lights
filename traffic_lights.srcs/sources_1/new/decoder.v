`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2023 03:40:51 PM
// Design Name: 
// Module Name: decoder
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


module decoder(
    input [2:0] en,         //state as enable
    output reg [3:0] an     
    );
    
    always @(en)    //this is basically a counter
    begin
    case(en)
    0: an=4'b1110;      //first bit of display is on
    1: an=4'b1110;      //first bit of display is on
    2: an=4'b1110;      //first bit of display is on
    3: an=4'b1110;      //first bit of display is on
    4: an=4'b1110;      //first bit of display is on
    endcase
    end
            
endmodule

