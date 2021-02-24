`timescale 1ns / 1ps

`include "Parameters.v"   
module BranchDecisionMaking(
    input wire [2:0] BranchTypeE,
    input wire [31:0] Operand1,Operand2,
    output reg BranchE
    );
	always@(*)
		case (BranchTypeE)
			`NOBRANCH: BranchE = 1'b0;//NOBRANCH
			`BEQ: BranchE = Operand1 == Operand2 ? 1'b1 : 1'b0; //BEQ
			`BNE: BranchE = Operand1 != Operand2 ? 1'b1 : 1'b0; //BNE
			`BLT: BranchE = $signed(Operand1) < $signed(Operand2) ? 1'b1 : 1'b0; //BLT
			`BGE: BranchE = $signed(Operand1) >= $signed(Operand2) ? 1'b1 : 1'b0; //BGE
			`BLTU: BranchE = Operand1 < Operand2 ? 1'b1 : 1'b0; //BLTU
			`BGEU: BranchE = Operand1 >= Operand2 ? 1'b1 : 1'b0; //BGEU
			default: BranchE = 1'b0;
		endcase
endmodule
