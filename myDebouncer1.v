module myDebouncer1(Clk, SRen, Sin, DB1out);
input Clk; 
input SRen; 
input Sin; 
output DB1out; // shift register parallel data outputs
wire [3:0] DFFout;
reg [3:0] SR; // shift register storage flip-flops
reg DB1outd;

always @(posedge Clk)
	if (SRen == 1'b1)
		begin
			SR[3:1] <= SR[2:0]; // shift the register contents
			SR[0] <= Sin; // first flip-flop receives serial input
		end
	else
		SR[3:0] <= SR[3:0]; // shift register does not do anything



assign DFFout[3:0] = SR[3:0];

always@(posedge Clk)

if (DFFout[3] == 1'b1 ) //kontrol etmeye basla
	
		if ( 1'b1 == DFFout[0] & DFFout[1] & DFFout[2])
		DB1outd <= 1'b1;
		else
		DB1outd <= DB1outd;
	
else
	
		if (1'b0 == DFFout[0] | DFFout[1] | DFFout[2])
		DB1outd <= 1'b0;
		else
		DB1outd <= DB1outd;

assign DB1out = DB1outd;
 
endmodule


