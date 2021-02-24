`timescale 1ns / 1ps

module IFSegReg(
    input wire clk,
    input wire en, clear,
    input wire [31:0] PC_In,
    output reg [31:0] PCF
    );
    initial PCF = 0;
    
    always@(posedge clk)
        if(en) begin
            if(clear)
                PCF <= 0;
            else 
                PCF <= PC_In;
        end
    
endmodule

