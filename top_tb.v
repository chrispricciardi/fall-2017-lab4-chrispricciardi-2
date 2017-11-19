
`timescale 1ns / 1ps

module top_tb();
	reg  clk;
	reg  reset;
//	reg [31:0] A = 32'h0000ffff; 
	//reg [31:0] B = 32'h00010000; 
	

    top DUT(
        .clk(clk),
        .reset(reset)
	//.A(A), 
	//.B(B)
        );

    initial
    begin
        $dumpfile("top.vcd");
        $dumpvars(0, top_tb);


		clk = 0;
		reset = 1;

		#20
		reset = 0;

	
		#10000
		$finish;

        $finish;
    end

    always 
        #10 clk = !clk;

endmodule
