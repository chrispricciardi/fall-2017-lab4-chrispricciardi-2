//Multiplier register with enable
module mr_reg(clk, reset, mr_in, product, PRODUCT);

  input clk, reset, mr_in;
  input [31 : 0] product;
  output reg [31 : 0] PRODUCT = 0;

  // Your code begins here
always @(posedge clk) 
	begin 
		if(reset == 1) begin 
			PRODUCT <= 0; 
		end else if(mr_in == 1) begin
		 	PRODUCT <= product; 
		end 
	end 
endmodule
