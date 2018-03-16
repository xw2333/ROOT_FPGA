`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:29:01 06/12/2015 
// Design Name: 
// Module Name:    median 
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
module big(input  clk,rst_n,din_flag,
              input  wire[7:0] p1,p2,p3,p4,p5,p6,p7,p8,p9,
				  output reg [7:0] median
              );
wire [7:0] max0,med0,min0,	max1,med1,min1,max2,med2,min2,
          
			   max_min,	med_med,
            min_max,final_med;	
(*KEEP="TRUE"*)	 wire [7:0]	 max_max, max_med,med_max,med_min,min_med,min_min,final_max,final_min;	  
middle m0 (
    .clk(clk), 
    .a(p1), 
    .b(p2), 
    .c(p3), 
    .max(max0), 
    .med(med0), 
    .min(min0)
    );
middle m1 (
    .clk(clk), 
    .a(p4), 
    .b(p5), 
    .c(p6), 
    .max(max1), 
    .med(med1), 
    .min(min1)
    );
middle m2 (
    .clk(clk), 
    .a(p7), 
    .b(p8), 
    .c(p9), 
    .max(max2), 
    .med(med2), 
    .min(min2)
    );	 
middle m3 (
    .clk(clk), 
    .a(max0), 
    .b(max1), 
    .c(max2), 
    .max(max_max), 
    .med(max_med), 
    .min(max_min)
    );

middle m4 (
    .clk(clk), 
    .a(med0), 
    .b(med1), 
    .c(med2), 
    .max(med_max), 
    .med(med_med), 
    .min(med_min)
    );
middle m5 (
    .clk(clk), 
    .a(min0), 
    .b(min1), 
    .c(min2), 
    .max(min_max), 
    .med(min_med), 
    .min(min_min)
    );
middle m6 (
    .clk(clk), 
    .a(min_max), 
    .b(med_med), 
    .c(max_min), 
    .max(final_max), 
    .med(final_med), 
    .min(final_min)
    );
	 
	 
	 always @(posedge clk)
	    if(!rst_n)
		 median<=0;
		 else
	      begin
			  if(din_flag)
			   begin
			   
				 //median<=max_med;
				 median<=final_med;
				end

			end	

		
endmodule
