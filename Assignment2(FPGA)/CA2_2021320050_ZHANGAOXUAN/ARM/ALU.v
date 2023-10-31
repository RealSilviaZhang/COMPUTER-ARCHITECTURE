module ALU(
	//TODO: Add some input or output parameters to deliever operands and results
	input [31:0] SrcA,
	input [31:0] SrcB,
	input [ 3:0] ALUOp,
	output reg [ 3:0] ALUFlags,	
	output reg [31:0] ALUResult		
	);
	
	always @ (*)
	//TODO: Write code for ALU calculation by cases(e.g., ADD, SUB)
	begin
		case(ALUOp)
		4'b0100: begin  // ADD
			ALUResult = SrcA + SrcB;
			ALUFlags = 4'b0000;
		end		
		4'b0010: begin  // SUB
			ALUResult = SrcA - SrcB;
			ALUFlags = 4'b0000;
		end
		4'b1010: begin  // CMP 
			ALUResult = SrcA - SrcB;
			ALUFlags = (SrcA == SrcB) ? 4'b0100 : 4'b0000;
		end	
	//TODO: Write code for data transfer instruction(e.g., MOV)
		4'b1101: begin  // MOV
			ALUResult = SrcB;
			ALUFlags = 4'b0000;			
		end
		default: begin 
			ALUResult = 32'h0;
			ALUFlags = 4'b0000;
		end 
		endcase
	end
	
endmodule 
		