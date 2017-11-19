//Partial Sum Register with enable
module ps_reg(clk, reset, ps_in, sum, ps);

  input clk, reset, ps_in;
  input [31 : 0] sum;
  output reg [31 : 0] ps = 0;

  // Your code begins here
always @(posedge clk) 
	begin 
		if(reset == 1) begin 
			ps <= 0; 
		end else if (ps_in == 1) begin
		      ps <= sum; 
		end
	end 
endmodule
