//ADD WITH ENABLE
module adder(clk, PRODUCT, ps, sum, add_enable);
 //does this need a reset?
  //input [31 : 0] product; //output from multiplier
  input clk;
  input [31:0] PRODUCT; 
  input [31:0] ps; //PARTIAL SUM REGISTER
  input add_enable; //for testing purposes
 
  output reg [31:0] sum;

  // Your code begins here

always @ (posedge clk)
begin
	if (add_enable == 1)begin  
	sum <= PRODUCT + ps; 
	end 
	//end else begin
		//SUM <= 0; 
	//end
end

endmodule
