module Fast_median_filter(
				input	wire	[7:0]	din,
				input 	wire 			data_valuable,
				input 					sclk,
				input					s_rst_n,
				input					vsync,
				
				output wire [7:0] median,
				output	wire 			dout_flag
);

wire[7:0]Data00,Data01,Data02,Data10,Data11,Data12,Data20,Data21,Data22;
fliter_window		fliter_window_inst(
				.din			(din),
				.data_valuable	(data_valuable),
				.sclk			(sclk),
				.s_rst_n		(s_rst_n),
				.vsync			(vsync),
				
				.Data02			(Data02		),	
				.Data12			(Data12		),
				.Data22			(Data22		),
				                 
				.Data01			(Data01		),	
				.Data00			(Data00		),
				.Data11			(Data11		),
				.Data10			(Data10		),
				.Data21			(Data21		),	
				.Data20			(Data20		),					
				.dout_flag     ( dout_flag )
				
);

big			big_inst( 
				.clk				(sclk),
				.rst_n				(s_rst_n),
				.din_flag		(dout_flag),
				.p1				(Data00),
				.p2				(Data01),
				.p3				(Data02),
				.p4				(Data10),
				.p5				(Data11),
				.p6				(Data12),
				.p7				(Data20),
				.p8				(Data21),
				.p9				(Data22),
				.median         ( median)
              );
			  

endmodule