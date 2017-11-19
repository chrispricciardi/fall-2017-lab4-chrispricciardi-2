//Register with enable
module register(clk, reset, reg_in, d, q);

  input clk, reset, reg_in;
  input [31 : 0] d;
  output reg [3 : 0] q;

  // Your code begins here
always @(posedge clk) 
	begin 
		if(reset == 1) begin 
			q <= 0; 
		end else if(reg_in == 1) begin
		 	q <= d; 
		end 
	end 
endmodule
