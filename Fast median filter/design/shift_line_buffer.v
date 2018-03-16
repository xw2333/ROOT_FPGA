//3x3矩阵窗口
//2018.3.9
//封装成ip接口
//`define SIM
module shift_line_buffer(
					input 	wire	 		line_clk			,
					input 	wire			s_rst_n				,	
					input	wire 			in_line_vaild		,//在有效数据提前一个周期
					input 	wire 	[7:0]	din					,
					input  	wire			vsync				,//帧同步
					output 	wire	[7:0] 	taps0x				,
					output 	wire	[7:0] 	taps1x				,
					output	wire	[7:0] 	taps2x				,
					output  wire			done
);

`ifndef SIM
localparam IMAGE_WIDTH = 480 ;//
`else
localparam IMAGE_WIDTH = 8 ;//480X272
`endif

wire empty1,empty2,pop1_en,pop2_en;
reg rd1_en,rd2_en;

wire prog_full1,prog_full2;
assign pop1_en=(prog_full1==1)?1'b1:vsync;//0？
always @(posedge line_clk or negedge s_rst_n)begin
	if(s_rst_n == 0)
		rd1_en=0;
	else if(pop1_en== 1 && in_line_vaild== 1)
		rd1_en=1;
	else if(empty1==1)
		rd1_en=0;		
end

fifo_512x8	fifo_512x8_inst1(
  .clk						(line_clk),
  .rst						(!s_rst_n),
  .din						(din),
  .wr_en					(in_line_vaild),
  .rd_en					(rd1_en),
  .prog_full_thresh			(IMAGE_WIDTH-3),//PROG_FULL_THRESH：用来设定PROG_FULL的有效时的数据数目，和无效时的数据数目
  .dout						(taps1x),
  .full						(),
  .empty					(empty1),
  .prog_full                (prog_full1)
);

assign pop2_en=(prog_full2==1)?1'b1:vsync;
always @(posedge line_clk or negedge s_rst_n)begin
	if(s_rst_n == 0)
		rd2_en=0;
	else if(pop2_en== 1 && in_line_vaild== 1)
		rd2_en=1;
	else if(empty2==1)
		rd2_en=0;		
end

assign out_line_vaild= rd1_en;
fifo_512x8	fifo_512x8_inst2(
  .clk						(line_clk),
  .rst						(!s_rst_n),
  .din						(taps1x),
  .wr_en					(out_line_vaild),
  .rd_en					(rd2_en),
  .prog_full_thresh			(IMAGE_WIDTH-3),//PROG_FULL_THRESH：用来设定PROG_FULL的有效时的数据数目，和无效时的数据数目
  .dout						(taps0x),
  .full						(),
  .empty					(empty2),
  .prog_full                (prog_full2)
);

assign taps2x=din;

reg done_r;
//assign done= rd2_en;
always @(posedge line_clk )begin
	//done<=rd2_en;
	done_r<=rd1_en;
end

assign done= done_r;

endmodule