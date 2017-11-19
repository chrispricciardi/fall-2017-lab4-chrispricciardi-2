//SRAMB
module sramb(
clk,
write,
wdata,
address,
rdata
);

input clk;
input write;
input [31:0] wdata;
input [3:0] address;
output reg [31:0] rdata; //had to make this a register to use in procedure? 

reg[31:0] mem [0:9];


// your code begins here

initial 
begin
 mem [0] = 32'h00018000;
 mem [1] = 32'h00018000;
 mem [2] = 32'h00050000;
 mem [3] = 32'h00020000;
 mem [4] = 32'h00050000;
 mem [5] = 32'h00030000;
 mem [6] = 32'h00038000;
 mem [7] = 32'h00050000;
 mem [8] = 32'h00040000;
 mem [9] = 32'h00030000;
end


/*initial 
begin
 mem [0] = 32'h00010000;
 mem [1] = 32'h00010000;
 mem [2] = 32'h00010000;
 mem [3] = 32'h00010000;
 mem [4] = 32'h00010000;
 mem [5] = 32'h00010000;
 mem [6] = 32'h00010000;
 mem [7] = 32'h00010000;
 mem [8] = 32'h00010000;
 mem [9] = 32'h00010000;
end
*/

always @(posedge clk)
begin 
	if (write == 1)begin 
	mem[address] <= wdata; 
	//rdata <= z; //check this
	end else if(write == 0)begin 
	rdata <= mem[address]; 
	end /* else begin 
	rdata <= z; //check this	
	end*/
end 
endmodule
