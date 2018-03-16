module fliter_window(
				input	wire	[7:0]	din,
				input 	wire 			data_valuable,
				input 					sclk,
				input					s_rst_n,
				input					vsync,
				
				output 	wire 	[7:0]	Data02,
				output 	wire 	[7:0]	Data12,
				output 	wire 	[7:0]	Data22,
				
				output 	reg 	[7:0]	Data01,	
				output 	reg 	[7:0]	Data00,
				output 	reg 	[7:0]	Data11,
				output 	reg 	[7:0]	Data10,
				output 	reg 	[7:0]	Data21,	
				output 	reg 	[7:0]	Data20,					
				output	wire 			dout_flag
				
);

//reg [7:0]Data00,Data10,Data20,Data01,Data02,Data11,Data12,Data21,Data22;//3x3矩阵
wire done;
reg[4:0] dout_flag_r;//根据仿真需要打6拍
always@ (posedge sclk )begin
dout_flag_r<={dout_flag_r[3:0],done};
end
/* reg [3:0] data_valuable_r;
always@ (posedge sclk )begin
data_valuable_r<={data_valuable_r[2:0],data_valuable};
end */

//assign dout_flag=dout_flag_r[4]&data_valuable_r[3];

assign dout_flag=dout_flag_r[4];

shift_line_buffer	shift_line_buffer_inst(
					.line_clk				(sclk			),
					.s_rst_n			(s_rst_n		)	,	
					.in_line_vaild		(data_valuable),//
					.din				(din			)	,
					.vsync				(vsync),
					.taps0x				(Data02			),
					.taps1x				(Data12			),
					.taps2x				(Data22		),
					.done              ( done         )
);	



//get data in the window
	always@(posedge sclk or negedge s_rst_n)
	begin
		if (!s_rst_n)
			begin
				Data01<=0;
				Data00<=0;
				Data11<=0;
				Data10<=0;
				Data21<=0;
				Data20<=0;						
			end
		else
			begin
				{Data00,Data01}<={Data01,Data02};
				{Data10,Data11}<={Data11,Data12};
				{Data20,Data21}<={Data21,Data22};			
			end
	end		
endmodule