//B register with enable
module b_reg(clk, reset, b_in, b, B);

  input clk, reset, b_in;
  input [31 : 0] b;
  output reg [31 : 0] B = 0;

  // Your code begins here
always @(posedge clk) 
	begin 
		if(reset == 1) begin 
			B <= 0; 
		end else if(b_in == 1) begin
		 	B <= b; 
		end 
	end 
endmodule
