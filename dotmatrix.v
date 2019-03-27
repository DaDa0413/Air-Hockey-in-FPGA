module dotmatrix(clk,gamestate,dot_row,dot0_col,dot1_col,
                      my_plate,enemy_plate,x,y, 
                      rscore,lscore);
    input clk;
    input [1:0]gamestate;
    input [3:0]x;
    input [2:0]y;
    input [7:0]my_plate;
    input [7:0]enemy_plate;
    input [6:0]rscore,lscore;
    output [7:0]dot_row;
    output [7:0]dot0_col,dot1_col;
    
    reg [7:0]dot_row;
    reg [7:0]dot0_col;
    reg [7:0]dot1_col;
    reg [3:0] step=0;
	 reg [15:0] dot_col;
	 


    
    //0 = left dotmatrix,1 = right dotmatrix,0~7 from left to right and up to down
    always@(posedge clk)
    begin
			if (step == 4'd0) 
				step = 4'd15;
			else 
				step = step - 4'd1;
			
			dot_row = 8'b11111111;
			{dot0_col,dot1_col} = dot_col;
			dot_col = 16'b00000000_00000000;
			case(gamestate)
				0://開場動畫HOCKEY 0=LEFT 1=RIGHT
				begin
					dot_col[step] = 1;
					case (step)
						15:dot_row=8'b11111111;
						14:dot_row=8'b00011111;
						13:dot_row=8'b10111111;
						12:dot_row=8'b00011111;
						11:dot_row=8'b11111000;
						10:dot_row=8'b11111010;
						9: dot_row=8'b11111000;
						8: dot_row=8'b00011111;
						7: dot_row=8'b01011111;
						6: dot_row=8'b01011111;
						5: dot_row=8'b11111000;
						4: dot_row=8'b11111101;
						3: dot_row=8'b11111010;
						2: dot_row=8'b01111111;
						1: dot_row=8'b10011111;
						0: dot_row=8'b01111111;
					endcase	
				end
			
            1://遊戲畫面
            begin
					dot_col[step] = 1;
					case(x)
						1:
						case (step)
							14:dot_row= ~enemy_plate;
							15:dot_row= ~my_plate;
							13:dot_row= ~(8'b00000001<<y);
							12:dot_row=8'b11111111;
							11:dot_row=8'b11111111;
							10:dot_row=8'b11111111;
							9: dot_row=8'b11111111;
							8: dot_row=8'b11111111;
							7: dot_row=8'b11111111;
							6: dot_row=8'b11111111;
							5: dot_row=8'b11111111;
							4: dot_row=8'b11111111;
							3: dot_row=8'b11111111;
							2: dot_row=8'b11111111;
							1: dot_row=8'b11111111;
							0: dot_row=8'b11111111;
						endcase	
						
						2:
						case (step)
							14:dot_row= ~enemy_plate;
							15:dot_row= ~my_plate;
							13:dot_row=8'b11111111;
							12:dot_row= ~(8'b00000001<<y);
							11:dot_row=8'b11111111;
							10:dot_row=8'b11111111;
							9: dot_row=8'b11111111;
							8: dot_row=8'b11111111;
							7: dot_row=8'b11111111;
							6: dot_row=8'b11111111;
							5: dot_row=8'b11111111;
							4: dot_row=8'b11111111;
							3: dot_row=8'b11111111;
							2: dot_row=8'b11111111;
							1: dot_row=8'b11111111;
							0: dot_row=8'b11111111;
						endcase	
						3:
						case (step)
							14:dot_row= ~enemy_plate;
							15:dot_row= ~my_plate;
							13:dot_row=8'b11111111;
							12:dot_row=8'b11111111; 
							11:dot_row=~(8'b00000001<<y);
							10:dot_row=8'b11111111;
							9: dot_row=8'b11111111;
							8: dot_row=8'b11111111;
							7: dot_row=8'b11111111;
							6: dot_row=8'b11111111;
							5: dot_row=8'b11111111;
							4: dot_row=8'b11111111;
							3: dot_row=8'b11111111;
							2: dot_row=8'b11111111;
							1: dot_row=8'b11111111;
							0: dot_row=8'b11111111;
						endcase
						4:
						case (step)
							14:dot_row= ~enemy_plate;
							15:dot_row= ~my_plate;
							13:dot_row=8'b11111111;
							12:dot_row=8'b11111111; 
							11:dot_row=8'b11111111; 
							10:dot_row=~(8'b00000001<<y);
							9: dot_row=8'b11111111;
							8: dot_row=8'b11111111;
							7: dot_row=8'b11111111;
							6: dot_row=8'b11111111;
							5: dot_row=8'b11111111;
							4: dot_row=8'b11111111;
							3: dot_row=8'b11111111;
							2: dot_row=8'b11111111;
							1: dot_row=8'b11111111;
							0: dot_row=8'b11111111;
						endcase	

						5:
						case (step)
							14:dot_row= ~enemy_plate;
							15:dot_row= ~my_plate;
							13:dot_row=8'b11111111;
							12:dot_row=8'b11111111; 
							11:dot_row=8'b11111111; 
							10:dot_row=8'b11111111;
							9: dot_row=~(8'b00000001<<y);
							8: dot_row=8'b11111111;
							7: dot_row=8'b11111111;
							6: dot_row=8'b11111111;
							5: dot_row=8'b11111111;
							4: dot_row=8'b11111111;
							3: dot_row=8'b11111111;
							2: dot_row=8'b11111111;
							1: dot_row=8'b11111111;
							0: dot_row=8'b11111111;
						endcase	
						6:
						case (step)
							14:dot_row= ~enemy_plate;
							15:dot_row= ~my_plate;
							13:dot_row=8'b11111111;
							12:dot_row=8'b11111111; 
							11:dot_row=8'b11111111; 
							10:dot_row=8'b11111111;
							9: dot_row=8'b11111111;
							8: dot_row=~(8'b00000001<<y);
							7: dot_row=8'b11111111;
							6: dot_row=8'b11111111;
							5: dot_row=8'b11111111;
							4: dot_row=8'b11111111;
							3: dot_row=8'b11111111;
							2: dot_row=8'b11111111;
							1: dot_row=8'b11111111;
							0: dot_row=8'b11111111;	
						endcase	
						7:
						case (step)
							14:dot_row= ~enemy_plate;
							15:dot_row= ~my_plate;
							13:dot_row=8'b11111111;
							12:dot_row=8'b11111111; 
							11:dot_row=8'b11111111; 
							10:dot_row=8'b11111111;
							9: dot_row=8'b11111111;
							8: dot_row=8'b11111111;
							7: dot_row=~(8'b00000001<<y);
							6: dot_row=8'b11111111;
							5: dot_row=8'b11111111;
							4: dot_row=8'b11111111;
							3: dot_row=8'b11111111;
							2: dot_row=8'b11111111;
							1: dot_row=8'b11111111;
							0: dot_row=8'b11111111;
						endcase	
						8:
						case (step)
							14:dot_row= ~enemy_plate;
							15:dot_row= ~my_plate;
							13:dot_row=8'b11111111;
							12:dot_row=8'b11111111; 
							11:dot_row=8'b11111111; 
							10:dot_row=8'b11111111;
							9: dot_row=8'b11111111;
							8: dot_row=8'b11111111;
							7: dot_row=8'b11111111;
							6: dot_row=~(8'b00000001<<y);
							5: dot_row=8'b11111111;
							4: dot_row=8'b11111111;
							3: dot_row=8'b11111111;
							2: dot_row=8'b11111111;
							1: dot_row=8'b11111111;
							0: dot_row=8'b11111111;
						endcase	
						9:
						case (step)
							14:dot_row= ~enemy_plate;
							15:dot_row= ~my_plate;
							13:dot_row=8'b11111111;
							12:dot_row=8'b11111111; 
							11:dot_row=8'b11111111; 
							10:dot_row=8'b11111111;
							9: dot_row=8'b11111111;
							8: dot_row=8'b11111111;
							7: dot_row=8'b11111111;
							6: dot_row=8'b11111111;
							5: dot_row=~(8'b00000001<<y);
							4: dot_row=8'b11111111;
							3: dot_row=8'b11111111;
							2: dot_row=8'b11111111;
							1: dot_row=8'b11111111;
							0: dot_row=8'b11111111;
						endcase	
						10:
						case (step)
							14:dot_row= ~enemy_plate;
							15:dot_row= ~my_plate;
							13:dot_row=8'b11111111;
							12:dot_row=8'b11111111; 
							11:dot_row=8'b11111111; 
							10:dot_row=8'b11111111;
							9: dot_row=8'b11111111;
							8: dot_row=8'b11111111;
							7: dot_row=8'b11111111;
							6: dot_row=8'b11111111;
							5: dot_row=8'b11111111;
							4: dot_row=~(8'b00000001<<y);
							3: dot_row=8'b11111111;
							2: dot_row=8'b11111111;
							1: dot_row=8'b11111111;
							0: dot_row=8'b11111111;
						endcase	
						11:
						case (step)
							14:dot_row= ~enemy_plate;
							15:dot_row= ~my_plate;
							13:dot_row=8'b11111111;
							12:dot_row=8'b11111111; 
							11:dot_row=8'b11111111; 
							10:dot_row=8'b11111111;
							9: dot_row=8'b11111111;
							8: dot_row=8'b11111111;
							7: dot_row=8'b11111111;
							6: dot_row=8'b11111111;
							5: dot_row=8'b11111111;
							4: dot_row=8'b11111111;
							3: dot_row=~(8'b00000001<<y);
							2: dot_row=8'b11111111;
							1: dot_row=8'b11111111;
							0: dot_row=8'b11111111;
						endcase	
						12:
						case (step)
							14:dot_row= ~enemy_plate;
							15:dot_row= ~my_plate;
							13:dot_row=8'b11111111;
							12:dot_row=8'b11111111; 
							11:dot_row=8'b11111111; 
							10:dot_row=8'b11111111;
							9: dot_row=8'b11111111;
							8: dot_row=8'b11111111;
							7: dot_row=8'b11111111;
							6: dot_row=8'b11111111;
							5: dot_row=8'b11111111;
							4: dot_row=8'b11111111;
							3: dot_row=8'b11111111;
							2: dot_row=~(8'b00000001<<y);
							1: dot_row=8'b11111111;
							0: dot_row=8'b11111111;
						endcase	
						13:
						case (step)
							14:dot_row= ~enemy_plate;
							15:dot_row= ~my_plate;
							13:dot_row=8'b11111111;
							12:dot_row=8'b11111111; 
							11:dot_row=8'b11111111; 
							10:dot_row=8'b11111111;
							9: dot_row=8'b11111111;
							8: dot_row=8'b11111111;
							7: dot_row=8'b11111111;
							6: dot_row=8'b11111111;
							5: dot_row=8'b11111111;
							4: dot_row=8'b11111111;
							3: dot_row=8'b11111111;
							2: dot_row=8'b11111111;
							1: dot_row=~(8'b00000001<<y);
							0: dot_row=8'b11111111;
						endcase	
						14:
						case (step)
							14:dot_row= ~enemy_plate;
							15:dot_row= ~my_plate;
							13:dot_row=8'b11111111;
							12:dot_row=8'b11111111; 
							11:dot_row=8'b11111111; 
							10:dot_row=8'b11111111;
							9: dot_row=8'b11111111;
							8: dot_row=8'b11111111;
							7: dot_row=8'b11111111;
							6: dot_row=8'b11111111;
							5: dot_row=8'b11111111;
							4: dot_row=8'b11111111;
							3: dot_row=8'b11111111;
							2: dot_row=8'b11111111;
							1: dot_row=8'b11111111;
							0: dot_row=~(8'b00000001<<y);
						endcase	
					endcase      
            end 
                
            2:
            begin
               if(rscore == lscore)
					begin
						dot_col[step] = 1;
						case (step)
							15:dot_row=8'b11111111;
							14:dot_row=8'b11111111;
							13:dot_row=8'b10000001;
							12:dot_row=8'b10111110;
							11:dot_row=8'b10111110;
							10:dot_row=8'b11011101;
							9: dot_row=8'b11100011;
							8: dot_row=8'b11111111;
							7: dot_row=8'b11111111;
							6: dot_row=8'b11111111;
							5: dot_row=8'b10000001;
							4: dot_row=8'b10111110;
							3: dot_row=8'b10111110;
							2: dot_row=8'b11011101;
							1: dot_row=8'b11100011;
							0: dot_row=8'b11111111;
						
											
						endcase	
					end
					
               else if(rscore > lscore)//right win
               begin
						dot_col[step] = 1;
						case (step)
							15:dot_row=8'b11111111;
							14:dot_row=8'b11111111;
							13:dot_row=8'b11111111;
							12:dot_row=8'b11111111;
							11:dot_row=8'b11111111;
							10:dot_row=8'b11111111;
							9: dot_row=8'b11111111;
							8: dot_row=8'b11111111;
							7: dot_row=8'b11111111;
							6: dot_row=8'b10001111;
							5: dot_row=8'b11100011;
							4: dot_row=8'b11111001;
							3: dot_row=8'b11000111;
							2: dot_row=8'b11111001;
							1: dot_row=8'b11100011;
							0: dot_row=8'b10001111;
						endcase	
					end               
               else
					begin
						dot_col[step] = 1;
						case (step)
							15:dot_row=8'b11111111;
							14:dot_row=8'b10001111;
							13:dot_row=8'b11100011;
							12:dot_row=8'b11111001;
							11:dot_row=8'b11000111;
							10:dot_row=8'b11111001;
							9: dot_row=8'b11100011;
							8: dot_row=8'b10001111;
							7: dot_row=8'b11111111;
							6: dot_row=8'b11111111;
							5: dot_row=8'b11111111;
							4: dot_row=8'b11111111;
							3: dot_row=8'b11111111;
							2: dot_row=8'b11111111;
							1: dot_row=8'b11111111;
							0: dot_row=8'b11111111;
						endcase	
					end	
            end
        endcase 
   end      
endmodule 
