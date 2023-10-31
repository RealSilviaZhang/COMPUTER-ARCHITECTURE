module Extend( 
	/*TODO: Declare variables of inputs and output for multiplexer*/
	input [23:0] in,
	input [ 1:0] ImmSrc,
	output reg[31:0] ExtImm		
	);
	
	always @ (*)
	begin
		case(ImmSrc /*TODO: Write on Variable name to distinguish various cases*/)
		2'b00/*TODO: Case 1*/: // zero extended-imm8
		begin
			//TODO: Write actions to run when (Variable) == (Case 1).
			ExtImm = {24'b0,in[7:0]};
		end
		
		2'b01/*TODO: Case 2*/: // zero extended-imm12
		begin
			//TODO: Write actions to run when (Variable) == (Case 2).
			ExtImm = {20'b0,in[11:0]};				
		end
		
		2'b10/*TODO: Case 3*/: // : sign-extended-imm24, shifting left two bits
		begin
			//TODO: Write actions to run when (Variable) == (Case 3).
			ExtImm = {{6{in[23]}},in[23:0],2'b00};	
		end
		
		default:
			//TODO: Assign the default value to output variable
			ExtImm = 32'h0;
		endcase
	end

endmodule
