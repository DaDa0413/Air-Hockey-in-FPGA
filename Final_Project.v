//我們需要2個time 1個是div_clk，用來控制遊戲的變化的，+1的頻率較快
//另一個是count_time，用來計算遊戲進行的時間的，每1秒+1
//如果有時間的話我們在擴充功能:隨著時間增加，遊戲的速度會加快
module Final_Project(reset,sw1,sw2,sw3,sw4,FPGA_clk,dot_row,dot0_col,dot1_col,
							out1, out2, out3, out4, out5, out6);
input FPGA_clk;	//50Mhz
input reset, sw1, sw2, sw3, sw4;//sw 9, sw 8, sw 1, sw 0
output [7:0]dot_row, dot0_col, dot1_col;
output [6:0]out1, out2, out3, out4, out5, out6;
reg [3:0]x = 4'd14;	//position x 0~15
reg move_x = 1'b1;	//for the ball to go right or left
reg [1:0]move_y = 2'd2;	//for y to go up, go down or won't change
reg [2:0]y = 3'd3;	//position y 0~7
reg [1:0]gamestate = 2'd0;	//0 for start animation, 1 for game start, 2 for end animation	
//reg [7:0]temp;//for temporary store the state of plate
reg [6:0]timecount = 7'd5; //for seven display
reg [6:0]lscore, rscore;
wire [7:0]my_plate, enemy_plate;// for temporary plate 
wire ballclk;
wire plateclk;
wire timeclk;
wire refreshclk;	
wire dotmatrixclk;
wire goalclk;
wire [7:0]dot_row, dot0_col, dot1_col;
wire [6:0]out1, out2, out3, out4, out5, out6;


	
dotmatrix DOT(.clk(dotmatrixclk), .gamestate(gamestate), .dot_row(dot_row), 
				  .dot0_col(dot0_col), .dot1_col(dot1_col), .my_plate(my_plate),
				  .rscore(rscore), .lscore(lscore),
				  .enemy_plate(enemy_plate), .x(x), .y(y));
				  
plate PLA (.reset(reset), .clk(plateclk), .sw1(sw1), .sw2(sw2), .sw3(sw3), .sw4(sw4), 
			  .nextleftpos(my_plate), .nextrightpos(enemy_plate));
			  
sevendisplay SEV(.lscore(lscore), .rscore(rscore), .timecount(timecount),
					  .out1(out1), .out2(out2), .out3(out3), .out4(out4),
					  .out5(out5), .out6(out6));
					  
clock CLK(.clk(FPGA_clk), .ballclk(ballclk), .plateclk(plateclk),
			 .timeclk(timeclk), .refreshclk(refreshclk), .dotmatrixclk(dotmatrixclk),.goalclk(goalclk));	
				
	//assign temp_my_plate = my_plate_pos;
	//assign temp_enemy_plate = enemy_plate_pos;
	//assign my_plate = my_plate_pos;
	//assign enemy_plate = enemy_plate_pos;
	always@(posedge FPGA_clk) 	//calculate y	y+~7, -~0
	begin						//參與的變數有 div_clk y
		if(!reset)				//reset
		begin
			timecount = 7'd5;
			move_x = 1'b1;
			move_y = 2'd2;
			x = 4'd14;
			y = 3'd3;
			lscore = 0;
			rscore = 0;
			gamestate = 2'd0;
			
		end
		else						//not reset
		begin					//如果將y也設成大小為8的陣列是否會比較好實行
//*************for start animation*****************
			if(gamestate == 2'd0)	
			begin
				if(timeclk)
				begin
					if(timecount == 7'd0)
					begin
						timecount = 7'd99; 
						gamestate = 2'd1;
					end
					else
					begin
						if(timeclk)
						begin	
							timecount = timecount - 7'd1;
						end
						else
							timecount = timecount;
					end	
				end
				else
				begin
					timecount = timecount;
				end
			end
//***************for game start*****************
			else if(gamestate == 2'd1)	
			begin	
				//=======begin if(timeclk)======
				if(timeclk)
				begin
					if(timecount == 7'd0)
							gamestate = 2'd2;
					else
					begin
							timecount = timecount - 7'd1;
					end
				end
				//======end if(timeclk)========
				//=======begin if(ballclk)==================
				if(ballclk)
				begin	
					//======begin case(move_x)==========
					case(move_x)			//x=1->14
					0:
					begin
						//here
						if(x == 4'd14)
						begin
							move_x = 1'd1;//
					//		temp = my_plate;
					//		temp = temp >> y;	//temp=01110000  y=6  temp>>6=00000001
							if((my_plate >> y) == 3'd7)//temp=01110000  y=6  temp>>6=00000001
							begin
								move_y = 2'd1;
								if(y == 3'd0)
									move_y = 2'd3;	
							end
							else if((my_plate >> y) == 3'd3)
								move_y = 2'd2;
							else if((my_plate >> y) == 3'd1)
							begin
								move_y = 2'd3;
								if(y == 3'd7)
									move_y = 2'd1;
							end
							else
							begin
								lscore = lscore + 7'd1;
								gamestate = 2'd3;//遊戲結束
							end	
						end									
						else
							move_x = 1'd0;
						x = x + 4'd1;
						end
					1:							//x=14->1
					begin
						//x = x - 4'd1;
						if(x == 4'd1)
						begin
							move_x = 1'd0;
					//		temp = enemy_plate;
					//		temp = temp >> y;	//temp=01110000  y=6  temp>>6=00000001
							if((enemy_plate >> y) == 3'd7)
							begin
								move_y = 2'd1;
								if(y == 3'd0)
									move_y = 2'd3;	
							end
							else if((enemy_plate >> y) == 3'd3)
								move_y = 2'd2;
							else if((enemy_plate >> y) == 3'd1)
							begin
								move_y = 2'd3;
								if(y == 3'd7)
									move_y = 2'd1;
							end
							else
							begin
								rscore = rscore + 7'd1;
								gamestate = 2'd3;//遊戲結束
							end
						end
						else
							move_x = 1'd1;
						x = x - 4'd1;
					end
					endcase	
					//======end case(move_x)================
					
					//========begin  if(move_y == 2'd1)=========
					if(move_y == 2'd1)			//Y move 1下 move 2水平 move 3上
					begin
						if(y == 3'd0)
							move_y = 2'd3;
						else	
							y = y - 3'd1;
					end	
					else if(move_y == 2'd3)
					begin
						if(y == 3'd7)
							move_y = 2'd1;
						else
							y = y + 3'd1;
					end
					else
						y = y;
					//=======end if(move_y == 2'd1)=============
				end
				else
				begin
					move_x = move_x;
					move_y = move_y;
					x = x;
					y = y;
				end
				//=======end if(ballclk)==================
			end
		
			
//****************for end animation*****************
			else if (gamestate == 2'd2)
			begin
				rscore = rscore;
				lscore = lscore;
				timecount = timecount;
			end
//*****************for goooooooal*******************
			else//gamestate == 3
			begin
				if(goalclk)
				begin
					move_x = 1'b1;
					move_y = 2'd2;
					x = 4'd14;
					y = 3'd3;
					gamestate = 2'd1;
				end
				else
					gamestate = 2'd3;
			end
		end
	end

endmodule 