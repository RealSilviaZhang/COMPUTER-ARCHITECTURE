module RegisterFile(
	input clk,
	input reset,
	input we,
	input[1:0] RegSrc,
	input[3:0] addr1,
	input[3:0] addr2,
	input[3:0] addr3,
	input[3:0] waddr,
	input[31:0] wdata,
	input[31:0] pcin,
	output reg[31:0] data1,
	output reg[31:0] data2,
	output reg[31:0] data3,
	output[31:0] pcout
	);
	
	reg[31:0] registers[15:0];
	integer idx;
	
	assign pcout = registers[15];
		
	// write to register file
	always @ (negedge clk)
	begin
		if (reset)
		begin
			for(idx=0; idx<=15; idx=idx+1) begin
				registers[idx] = 'h00000000;
			end
		end
		else
		begin
			if(we)
			begin
				if(RegSrc[0] != 1'b1)
					registers[waddr] = wdata;
				else
					registers[14] = registers[15] + 'd4;
			end
			
			if (waddr != 4'b1111 || RegSrc[0] == 1'b1)
				registers[15] = pcin;
		end
	end
	
	// read from register file
	always @ (posedge clk)
	begin
		if (reset)
		begin
			data1 <= 'h00000000;
			data2 <= 'h00000000;
		end
		else
		begin
			if (addr1 == 15) begin
				data1 = registers[15] + 32'd8;
			end
			else begin
				data1 = registers[addr1];
			end
			
			if (addr2 == 15) begin
				data2 = registers[15] + 32'd8;
			end
			else
			begin
				// RegSrc MUX
				if (RegSrc[1] == 1'b0)
					data2 = registers[addr2];
				else
					data2 = registers[waddr];
			end
			if (addr3 == 15) begin
				data3 = registers[15] + 32'd8;
			end
			else begin
				data3 = registers[addr3];
			end
		end
	end

endmodule