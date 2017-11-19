//MULTIPLY
//need to check states to add a done signal after 32 iterations
module mult(clk, reset, A, B, product, done, multiply_enable);

  input clk;
  input reset;
  input multiply_enable; //begins multiplication 

  input [31 : 0] B;
  input [31 : 0] A;
  output reg [31:0] product = 0; 
  output reg done = 0; //Done signal to control
  //output reg [31 : 0] product = 0;


  // Your code begins here

//DEFINING STATES OF FSM
parameter[2:0] SET = 3'b000;
parameter[2:0] MULTIPLY = 3'b001;
parameter[2:0] DONE = 3'b010;
parameter[2:0] IDLE = 3'b011; 

reg[63:0] prod =0;

reg[2:0]STATE = SET;
reg[2:0]NEXT_STATE = SET;

//process to implement the state register
always @ (posedge clk)
begin
	if(reset == 1'b1)begin
	STATE <= SET;
	end else if(reset == 1'b0)begin
	STATE <= NEXT_STATE;
	end
end

//process to determine next state 
always @ (STATE or multiply_enable)
begin
	case(STATE)
		SET: if(multiply_enable == 1)begin
			 		NEXT_STATE <= MULTIPLY; 
			 	end else if(multiply_enable == 0)begin 
			 		NEXT_STATE <= SET;
				end
		MULTIPLY: NEXT_STATE <= DONE;
		
		DONE: NEXT_STATE <= IDLE;  

		IDLE: if(multiply_enable == 1)begin
			 		NEXT_STATE <= MULTIPLY; 
			 	end else if(multiply_enable == 0)begin 
			 		NEXT_STATE <= IDLE;
				end

		default : NEXT_STATE <= SET;
	endcase
end

//statement to define the output values
always@(STATE or A or B) begin
	if(STATE == SET) begin 
		done <= 0; 
		product <= 0; 

	end else if(STATE == MULTIPLY)begin
		prod <= (A*B); 
		done <= 0;

	end else if(STATE == DONE)begin
		product <= prod[48:16];
		done <= 1; 
	end else if (STATE == IDLE)begin 
		done <= 0;
	end
end
endmodule
