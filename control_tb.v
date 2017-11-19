
module control_tb();

	reg clk;
	reg reset;
	reg done;

	wire [3:0] address;
	wire ps_in, fs_in, fs_out;
	


	control DUT(
		.clk(clk),
		.reset(reset),
		.done(done),
		.address(address),
		.ps_in(ps_in),
		.fs_in(fs_in), 
		.fs_out(fs_out)
	);

	initial 
	begin
		$dumpfile("control_tb.vcd");
		$dumpvars(0, control_tb);


		clk = 0;
		done = 0; 
		reset = 1;
		
		#100
		reset = 0;
		done = 0; 
		
		#100
		reset = 0;
		done = 1; 
		
		#100
		reset = 0;
		done = 0; 
		
		#100
		reset = 1;
		done = 0; 
		
		#100
		reset = 0;
		done = 1;
		
		#100
		reset = 0;
		done = 0; 		
		
		#10000
		$finish;

	end

	always 
		#10 clk <= !clk;
endmodule
