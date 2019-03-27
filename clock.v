`define OneSecond 32'd50000000
`define Balltime 32'd12500000//0.25 second
`define Refreshtime 32'd1250000//0.25 second
`define Platetime 32'd25000000//0.5 second
`define Dotmatrixtime 32'd40000//1/500 second
`define twosecond 32'd200000000
module clock(clk, ballclk, plateclk, timeclk, refreshclk, dotmatrixclk,goalclk);
input clk;
output ballclk, plateclk, timeclk, refreshclk, dotmatrixclk,goalclk;
reg ballclk, plateclk, timeclk, refreshclk, dotmatrixclk,goalclk;
reg [31:0]count1, count2, count3, count4, count5,count6;
/**********for game time count down***********/
always@(posedge clk)
begin
   if(count1 == `OneSecond)
   begin
      count1 <= 32'd0;
      timeclk <= 1;
   end
   else
   begin
      count1 <= count1 + 32'd1;
		timeclk <= 0;
	end
	
	if(count2 == `Balltime)
   begin
      count2 <= 32'd0;
      ballclk <= 1;
   end
   else
   begin
      count2 <= count2 + 32'd1;
		ballclk <= 0;
	end
	
	if(count3 == `Platetime)
   begin
      count3 <= 32'd0;
      plateclk <= 1;
   end
   else
   begin
      count3 <= count3 + 32'd1;
		plateclk <= 0;
	end
	
	if(count4 == `Refreshtime)
   begin
      count4 <= 32'd0;
      refreshclk <= 1;
   end
   else
   begin
      count4 <= count4 + 32'd1;
		refreshclk <= 0;
	end
	
	if(count5 == `Dotmatrixtime)
   begin
      count5 <= 32'd0;
      dotmatrixclk <= 1;
   end
   else
   begin
      count5 <= count5 + 32'd1;
		dotmatrixclk <= 0;
	end
	
	if(count6 == `twosecond)
   begin
      count6 <= 32'd0;
      goalclk <= 1;
   end
   else
   begin
      count6 <= count6 + 32'd1;
		goalclk <= 0;
	end
end

endmodule 