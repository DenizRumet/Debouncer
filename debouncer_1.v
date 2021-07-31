/*
Deniz Rumet FIRAT
25.4.21 
EE342 Lab#3
Debouncer module 1
*/

module debouncer_1(SwOut,Clk1ms,SwOutDB1);


	input SwOut,Clk1ms;
	output reg SwOutDB1; //registered output
		
	reg [3:0] DFF;
	
	always @(posedge Clk1ms)
	begin
		DFF[3:1] <= DFF[2:0];
		DFF[0] <= SwOut;
		
		if(DFF[3:0] == 4'b1111)
			SwOutDB1 <= 1'b1;
		else
			if(DFF[3:0] == 4'b0000)
				SwOutDB1 <= 1'b0;
			else
				SwOutDB1 <= SwOutDB1;
			
	end
	
endmodule



