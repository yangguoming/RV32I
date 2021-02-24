`timescale 1ns / 1ps
//功能说明
    //NPC_Generator是用来生成Next PC值得模块，根据不同的跳转信号选择不同的新PC值
//输入
    //PCF              旧的PC值
    //JalrTarget       jalr指令的对应的跳转目标
    //BranchTarget     branch指令的对应的跳转目标
    //JalTarget        jal指令的对应的跳转目标
    //BranchE==1       Ex阶段的Branch指令确定跳转
    //JalD==1          ID阶段的Jal指令确定跳转
    //JalrE==1         Ex阶段的Jalr指令确定跳转
//输出
    //PC_In            NPC的值
module NPC_Generator(
    input wire [31:0] PCF,JalrTarget, BranchTarget, JalTarget,
    input wire BranchE,JalD,JalrE,
    output reg [31:0] PC_In
    );
	always@(*)
		if(BranchE)
			PC_In = BranchTarget;
		else if(JalrE)
			PC_In = JalrTarget;
		else if(JalD)//这个不能放在上面两种情况之前，因为EX段的信号比ID段的信号早一条指令，跳转应该是先满足最早的
			PC_In = JalTarget;
		else
			PC_In = PCF + 4;
endmodule


