/*
Deniz Rumet FIRAT
25.4.21 
EE342 Lab#3
Debouncer module 2
*/


module debouncer_2(SwOut,Clk1ms,SwOutDB2);
	input SwOut,Clk1ms;
	output reg SwOutDB2;
	reg [3:0] DFF;

	always @(posedge Clk1ms)
	begin
		DFF[3:1] <= DFF[2:0];
		DFF[0] <= SwOut;
		
		if(SwOut==1'b1 && DFF[0]==1'b0 && DFF[1]==1'b0 && DFF[2]== 1'b0 && DFF[3] == 1'b0)  //((&DFF[3:0] == 1'b0))&&(SwOut==1'b1))
				SwOutDB2 <= SwOut; // 1'b1
		else 
			if(SwOut==1'b0 && DFF[0]==1'b1 && DFF[1]==1'b1 && DFF[2]== 1'b1 && DFF[3] == 1'b1)
				SwOutDB2 <= SwOut; // 1'b0
			else
				SwOutDB2 <= SwOutDB2;
	end			
/*
		else if(SwOut==1'b1 && ((DFF[0]&& DFF[1] && DFF[2])==0) )
				DFF[3] <= DFF[3];
		else if(SwOut==1'b0 && ((DFF[0]&& DFF[1] && DFF[2])==0) )
				DFF[3] <= DFF[3];
				*/	
	
endmodule
