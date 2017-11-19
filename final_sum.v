//Register with enable
module register(clk, reset, fs_in, ps, fs);

  input clk, reset, fs_in;
  input [31 : 0] ps;
  output reg [31 : 0] fs;

  // Your code begins here
always @(posedge clk) 
	begin 
		if(reset == 1) begin 
			fs <= 0; 
		end else if(reg_in == 1) begin
		 	fs <= ps; 
		end 
	end 
endmodule
