`timescale 1ns/1ns

module tb_filter_window;

reg sclk;
reg s_rst_n;
reg in_line_vaild;

reg [7:0] din;

wire[7:0] Data00;
wire [7:0] Data10;
wire [7:0] Data20;
wire[7:0] Data01;
wire [7:0] Data02;
wire [7:0] Data11;
wire[7:0] Data12;
wire [7:0] Data21;
wire [7:0] Data22;
wire		dout_flag;

//------------- generate system signals ------------------------------------
initial begin
	sclk = 1;
	s_rst_n <= 0;
	din<='d0;
in_line_vaild<=0;
#100
	s_rst_n <= 1;
	#100
		 in_line_vaild <= 1'b1;
	data_generate();
end

always #10 sclk = ~sclk;






fliter_window		fliter_window_inst(
				.din				(din			),
				.data_valuable		(in_line_vaild	),
				.sclk				(sclk			),
				.s_rst_n			(s_rst_n		),

				.Data00				(Data00			),
				.Data10				(Data10			),
				.Data20				(Data20			),
				.Data01				(Data01			),	
				.Data02				(Data02			),
				.Data11				(Data11			),
				.Data12				(Data12			),
				.Data21				(Data21			),	
				.Data22				(Data22			),					
				.dout_flag			(dout_flag		)
);

task data_generate();
integer i;
begin
for(i=0; i<1000; i=i+1) begin
	 #20 din<=din+1;
	 end
	 in_line_vaild<=0;
end
endtask

endmodule
