//Partial Sum Register with enable
module a_reg(clk, reset, a_in, a, A);

  input clk, reset, a_in;
  input [31 : 0] a;
  output reg [31 : 0] A = 0;

  // Your code begins here
always @(posedge clk) 
	begin 
		if(reset == 1) begin 
			A <= 0; 
		end else if(a_in == 1) begin
		 	A <= a; 
		end /*else begin 
			A <= 0; 
		end */
	end 
endmodule
