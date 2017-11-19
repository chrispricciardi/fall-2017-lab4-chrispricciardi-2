//TOP
module top(
clk,
reset
);

//---Inputs---
input clk;
input reset;

wire done;   //Multiplier done signal 
wire ps_in;  //partial sum register enable 
wire fs_in;  //final sum register enable 
wire fs_out; //final sum register output enable
wire a_in;   //a_reg enable 
wire b_in;   //b_reg enable
wire mr_in; 
wire write;  //write signal for SRAM (write = 0 implies read)

wire [31:0] A ; //output of a_reg 
wire [31:0] B ; //output of b_reg
wire [31:0] a ; //output of SRAMA
wire [31:0] b ; //output of SRAMB

wire [31:0] product;
wire [31:0] PRODUCT;
wire [31:0] ps; //partial sum
wire [31:0] sum; 
wire [31:0] fs; //final sum
wire [3:0] address;
wire [31:0] wdata; //data to SRAM


wire add_enable; 
wire multiply_enable; //Multiply enable  
//input ps_in; //Partial Sum register enable

control CONTROL(.clk(clk), 
	.reset(reset), 
	.done(done),
	.ps_in(ps_in), 
	.fs_in(fs_in), 
	.a_in(a_in), 
	.b_in(b_in), 
	.mr_in(mr_in),
	.address(address),
	.write(write),
	.multiply_enable(multiply_enable),
	.add_enable(add_enable),
	.fs_out(fs_out));

mult MULT(.clk(clk), 
	.product(product),
	.reset(reset),
	.done(done), 
	.multiply_enable(multiply_enable),
	.A(A),  //multiplier from srama
	.B(B));  //multiplier from sramb
	//.PRODUCT(PRODUCT)); //truncated floating point product 

adder ADDER(.clk(clk), 
	.PRODUCT(PRODUCT), 
	.ps(ps), 
 	.add_enable(add_enable), 
	.sum(sum)); 

ps_reg PS_REG(.clk(clk), 
	.reset(reset), 
	.ps_in(ps_in), 
	.sum(sum), 
	.ps(ps));

fs_reg FS_REG(.clk(clk), 
	.reset(reset), 
	.fs_in(fs_in),
	.ps(ps), 
	.fs(fs)); 
	
srama SRAMA(.clk(clk),
	.wdata(wdata), 
	.write(write),  
	.address(address), 
	.rdata(a)); 

sramb SRAMB(.clk(clk),
	.wdata(wdata),
	.write(write),  
	.address(address), 
	.rdata(b));  

a_reg A_REG(.clk(clk), 
	.reset(reset), 
	.a_in(a_in), 
	.a(a), 
	.A(A));

b_reg B_REG(.clk(clk), 
	.reset(reset), 
	.b_in(b_in), 
	.b(b), 
	.B(B));

mr_reg MR_REG(.clk(clk), 
	.reset(reset), 
	.mr_in(mr_in), 
	.product(product), 
	.PRODUCT(PRODUCT));

endmodule
