module plate(reset,clk,sw1,sw2,sw3,sw4,nextleftpos,nextrightpos);
input reset,clk, sw1, sw2, sw3, sw4;
//input [7:0]leftpos, rightpos;//sw1,sw3=方向 sw2,sw4=動開關 
output [7:0]nextleftpos, nextrightpos; //output 的位置要取補數喔~~ 
reg [7:0]nextleftpos=8'b00111000, nextrightpos=8'b00111000;



always@(posedge clk)	
begin
	if(!reset)
		nextleftpos <=8'b00111000;
	else
	begin
		if(sw2) //for left plate can move
		begin
			if(sw1)	//for go up	
			begin
				if(nextleftpos == 8'b11100000) 
					nextleftpos <= nextleftpos;
				else 
					nextleftpos <= nextleftpos<<1;	
			end
			else	//for go down
			begin
				if(nextleftpos == 8'b00000111)
					nextleftpos <= nextleftpos;
				else 
					nextleftpos <= nextleftpos>>1;
			end
		end
		else	//for left plate can't move
			nextleftpos <= nextleftpos;
	end
end
always@(posedge clk)
begin
	if(!reset)
		nextrightpos=8'b00111000;
	else
	begin
		if(sw4)	//for right plate can move
		begin
			if(sw3)	//for go up 
			begin	
				if(nextrightpos == 8'b11100000) 
					nextrightpos <= nextrightpos;
				else 
					nextrightpos <= nextrightpos<<1; 
			end
			else	//for go down
			begin
				if(nextrightpos == 8'b00000111)
					nextrightpos <= nextrightpos;
				else 
					nextrightpos <= nextrightpos>>1;
			end
		end
		else	//for right plate can't move
		begin
			nextrightpos <= nextrightpos;
		end	
	end
end
endmodule
