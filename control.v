module control(
	clk, // clk
	reset, // Active high, syn reset
	done, // Done signal from multiplier
	address, //Address to memory
	ps_in, //Partial sum register enable
	fs_in,//Final sum register enable
	a_in, 
	b_in, 
	mr_in, 
	fs_out, //Final sum register output tri-state enable 
	write, //Memory write enable
	multiply_enable,
	add_enable,
	STATE 
);

// Input Declaration
input  clk,reset,done;

// Ouput Declaration 
output reg  ps_in, fs_in, fs_out, a_in, b_in, mr_in, write; 
output reg multiply_enable, add_enable; 
output reg[3:0] address = 4'b0000; 
	
reg[5:0] count = 6'b0;  

//---Defining States---
parameter[2:0] S0 = 3'b000;
parameter[2:0] S1 = 3'b001; 
/*parameter[2:0] S2 = 3'b010; 
parameter[2:0] S3 = 3'b011;
parameter[2:0] S4 = 3'b100;
*/

output reg[2:0]STATE = S0;
reg[2:0]NEXT_STATE = S0;

//---process to implement the state register---

initial begin 
	write = 0; //reading from SRAM only
	add_enable = 1; 
end 

always @ (posedge clk)
begin
	if(reset==1'b1)begin
	STATE = S0;
	//count = 0; 
	address = 4'b0000; 
	end else if(reset==1'b0)begin
	STATE = NEXT_STATE;
	end
end

//---process to determine next state---


always @ (STATE or done)
begin
	case(STATE)
		S0: NEXT_STATE = S1;

		S1: if (done == 1) begin 
			NEXT_STATE = S0;
		end else if (done == 0)begin 
			NEXT_STATE = S1; 
		end

		default: NEXT_STATE = S0;
	endcase
end

//---statement to define the output values---

always@(STATE) begin
	case (STATE)
	
		S0: begin
		ps_in <= 1; 
		fs_in <= 0; 
		//fs_out<= 0;
		a_in <= 1; 
		b_in <= 1; 
		mr_in <= 1;   
 		multiply_enable <= 0;  
		//add_enable <= 0; 
		end
			
		S1: begin
		address <= address + 1; 
		ps_in <= 0; 
		fs_in <= 0; 
		//fs_out<= 0;
		a_in <= 0; 
		b_in <= 0; 
		mr_in <= 0;   
 		multiply_enable <= 1;  
		//add_enable <= 1; 
		end

		default:begin
		ps_in <= 0; 
		fs_in <= 0; 
		//fs_out<= 0;
		a_in <= 0; 
		b_in <= 0; 
		mr_in <= 0;   
 		multiply_enable <= 0;  
		//add_enable <= 0; 
		end
	endcase
end

endmodule 
