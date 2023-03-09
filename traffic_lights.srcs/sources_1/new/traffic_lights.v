`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2023 02:30:21 PM
// Design Name: 
// Module Name: traffic_lights
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



module traffic_lights(
    input clk,              //slow clock of 1Hz
    input reset,            //reset represent pedestrian button
    output reg [2:0] state, //state of each traffic light
    output reg [6:0] disp   //7segment display
    );
    
    //parameters used for each second shown in the 7 segment display
    parameter one = 7'b1001111;
    parameter two = 7'b0010010;
    parameter three = 7'b0000110;
    parameter four = 7'b1001100;
    parameter five = 7'b0100100;
    parameter six = 7'b0100000;
    parameter seven = 7'b0001111;
    parameter eight = 7'b0000000;
    parameter nine = 7'b0001100;
    
    reg [4:0] count_one = 0;        // internal counter 2^5, working as a one second timer
    reg [2:0] state=0;              // initialize state of traffic light to primary position
    
    //change of timer and state every time clk or state are high
    always @(posedge clk or posedge reset) begin
            count_one <= count_one+1;

        
        if(count_one==4) begin      //steps after timer hits 5
            state <= state + 1;     //state turns into the next state
                
            if(state == 3'b000 | state == 3'b010) begin     //after the green light, timer turns to 2
                count_one <= 3;
            end
            if (state == 3'b011) begin      //state should not exceed state 3 automatically
                state <= 3'b000;
            end
            if(state == 3'b001 | state==3'b011) begin       //after orange light, timer turns to 5
                count_one <= 0;
            end
            if(state == 3'b100) begin       //state go to primary state after ped light finished
                state <= 3'b000;
                count_one <= 0;
            end

        end
        
        else if(count_one == 7) begin       //steps after timer hits 7
            state <= 3'b100;
            count_one <= 0;
        end
        

        else if(state == 3'b001 | state==3'b011) begin      //steps after traffic light turns orange
            count_one <= 3;
            
            if(count_one == 5) begin        //continue increment after ped button hit
                count_one <= count_one+1;
            end
            
           if(count_one == 6)begin          //continue increment after ped button hit
                count_one <= count_one+1;
            end
            
            if(count_one == 7)begin         //ped button has hit timer max, so change state to "walk"
                state <= 3'b100;
                count_one <= 0;
            end
            
            if(count_one == 3) begin        //continue incerement after light turns orange
                count_one <= count_one + 1;
            end
            
            if(count_one == 4) begin        //timer turns zero and state changes
                count_one <= 0;
                state <= state+1;
            end
            
        end
        
        
        if(reset==1) begin      //steps after pedestrian hits button to walk
            state <= state;     //initially traffic light stays state stays the same
            count_one <= 5;     //timer turns to 5 to switch to ped light 
            
            if(state == 3'b100) begin       //if ped button hit while "walk" sign, ignore the button
                count_one <= count_one;
            end

        end   

    end
    
    
    //timer change on 7segment display every time counter changes
    always @(count_one)
    begin
        case(count_one)
            0: disp = five;     //five seconds left for cars
            1: disp = four;     //four seconds left for cars
            2: disp = three;    //three seconds left for cars
            3: disp = two;      //two seconds left for cars
            4: disp = one;      //one second left for cars
            5: disp = three;    //three seconds left for ped
            6: disp = two;      //two seconds left for ped
            7: disp = one;      //one second left for ped
            8: disp = nine;
            default: disp = five;
        endcase
    end
    
    
endmodule
