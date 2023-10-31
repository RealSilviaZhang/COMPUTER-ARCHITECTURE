`timescale 1ns / 1ps

module tb;

    // Inputs
    reg clk;
    reg [3:0] KEY;
	
    // Instantiate the Unit Under Test (UUT)
    ARM_System uut (
        .CLOCK_27(clk), 
        .KEY(KEY), 
        .SW(18'hfffff), 
        .UART_RXD(1'b1), 
        .UART_TXD(), 
        .HEX7(), 
        .HEX6(), 
        .HEX5(), 
        .HEX4(), 
        .HEX3(), 
        .HEX2(), 
        .HEX1(), 
        .HEX0(), 		
        .LEDR(), 
        .LEDG()
    );

    initial begin
        // Initialize Inputs
        clk = 0;
		KEY = 4'b1111;		
		#500;
		KEY = 4'b1110;		
		#500;
		KEY = 4'b1111;	
		
        #60000;		
        $finish;
    end
	
    always #5 clk=~clk;
endmodule

