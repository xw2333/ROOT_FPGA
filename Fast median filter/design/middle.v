`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:29:41 06/12/2015 
// Design Name: 
// Module Name:    middle 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module middle(input clk,
              input wire[7:0]a,b,c,
				  output reg[7:0]max,med,min
    );
always@(posedge clk)
begin
    if((a>=b)&&(a>=c)&&(b>=c))
    begin
       max<=a;
       min<=c;
       med<=b;
    end 
    else if((a>=b)&&(a>=c)&&(c>=b))
    begin
       max<=a;
       med<=c;
       min<=b;
    end 
    else if((b>=a)&&(b>=c)&&(a>=c))
    begin
       max<=b;
       med<=a;
       min<=c;
    end
    else if((b>=a)&&(b>=c)&&(c>=a))
    begin
       max<=b;
       med<=c;
       min<=a;
    end
    else if((c>=a)&&(c>=b)&&(a>=b))
    begin
       max<=c;
       med<=a;
       min<=b;
    end
    else
    begin
       max<=c;
       med<=b;
       min<=a;
    end
end

endmodule
