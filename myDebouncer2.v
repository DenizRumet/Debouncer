module myDebouncer2(Clk,Sin, DB2outd);
input Clk; 
input Sin; 
output reg DB2outd;
reg [3:0] SR;
reg [2:0] Cntr;





always @(posedge Clk)
begin
	if (Cntr[2:0] == 3'd0)
		begin
			SR[3:1] <= SR[2:0]; // shift the register contents
			SR[0] <= Sin; // first flip-flop receives serial input
		
		end
			

	else
		SR[3:0] <= SR[3:0]; // shift register does not do anything




if (SR[0]== 1'b1 & SR[1]==1'b0 || SR[3:0] == 1'b1 )	//checking for output is equal to one conditions
	
	DB2outd <= 1'b1;

else if (SR[0]== 1'b0 & SR[1]==1'b1 || SR[3:0] == 1'b0 ) //checking for output is equal to two conditions
	DB2outd <= 1'b0;
	
else 													//leave output as it is
	DB2outd <= DB2outd;
	
end

always @(posedge Clk)
begin
	if ((SR[0] ^ Sin == 1'b1) || (SRshift == 1'b1))
	Cntr[2:0] <= Cntr[2:0] + 3'd1; // increment counter
	else
		if (Cntr[2:0] == 3'd5)
		Cntr[2:0] <= 3'd0; // reset the counter
		else
		Cntr[2:0] <= Cntr[2:0]; // counter is idle
end

assign SRshift = (Cntr[2:0] == 3'd0) ? 1'b0 : 1'b1;
	


endmodule


