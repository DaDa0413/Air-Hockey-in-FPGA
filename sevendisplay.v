module sevendisplay	(lscore,rscore,timecount,
							 out1,out2,out3,out4,out5,out6
							 );

input [6:0]lscore,rscore,timecount; //可以餵0~128進來

output  [6:0] out1,out2,out3,out4,out5,out6; //由左到右，六個七段顯示器
reg
[3:0]decimal_lscore,digit_lscore, //lscore十位數和個位數
decimal_rscore,digit_rscore, //lscore十位數和個位數
decimal_timecount,digit_timecount; //time 十位數和個位數
reg
[6:0] out1,out2,out3,out4,out5,out6;

always@(lscore)	
begin
		decimal_lscore <= lscore/10; // lscore/10 為十位數
		case(decimal_lscore)
			1:out1<=7'b1111001;
			2:out1<=7'b0100100;
			3:out1<=7'b0110000;
			4:out1<=7'b0011001;
			5:out1<=7'b0010010;
			6:out1<=7'b0000010;
			7:out1<=7'b1111000;
			8:out1<=7'b0000000;
			9:out1<=7'b0010000;
			default:out1<=7'b1000000;
		endcase
		
		digit_lscore <= lscore%10; // lscore%10為個位數
		case(digit_lscore)
			1:out2<=7'b1111001;
			2:out2<=7'b0100100;
			3:out2<=7'b0110000;
			4:out2<=7'b0011001;
			5:out2<=7'b0010010;
			6:out2<=7'b0000010;
			7:out2<=7'b1111000;
			8:out2<=7'b0000000;
			9:out2<=7'b0010000;
			default:out2<=7'b1000000;
		endcase
end
always@(rscore)	
begin
		//----------------------------------------
		decimal_rscore <= rscore/10;
		case(decimal_rscore)
			1:out3<=7'b1111001;
			2:out3<=7'b0100100;
			3:out3<=7'b0110000;
			4:out3<=7'b0011001;
			5:out3<=7'b0010010;
			6:out3<=7'b0000010;
			7:out3<=7'b1111000;
			8:out3<=7'b0000000;
			9:out3<=7'b0010000;
			default:out3<=7'b1000000;
		endcase
		
		digit_rscore <= rscore%10;
		case(digit_rscore)
			1:out4<=7'b1111001;
			2:out4<=7'b0100100;
			3:out4<=7'b0110000;
			4:out4<=7'b0011001;
			5:out4<=7'b0010010;
			6:out4<=7'b0000010;
			7:out4<=7'b1111000;
			8:out4<=7'b0000000;
			9:out4<=7'b0010000;
			default:out4<=7'b1000000;
		endcase
end
always@(timecount)	
begin	
		decimal_timecount <= timecount/10;
		case(decimal_timecount)
			1:out5<=7'b1111001;
			2:out5<=7'b0100100;
			3:out5<=7'b0110000;
			4:out5<=7'b0011001;
			5:out5<=7'b0010010;
			6:out5<=7'b0000010;
			7:out5<=7'b1111000;
			8:out5<=7'b0000000;
			9:out5<=7'b0010000;
			default:out5<=7'b1000000;
		endcase
		
		digit_timecount <= timecount%10;
		case(digit_timecount)
			1:out6<=7'b1111001;
			2:out6<=7'b0100100;
			3:out6<=7'b0110000;
			4:out6<=7'b0011001;
			5:out6<=7'b0010010;
			6:out6<=7'b0000010;
			7:out6<=7'b1111000;
			8:out6<=7'b0000000;
			9:out6<=7'b0010000;
			default:out6<=7'b1000000;
		endcase
		//-----------------------------------------
end
endmodule
