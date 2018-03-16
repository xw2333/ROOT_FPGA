`timescale 1ns/1ns

module tb_shift_line_buffer;

reg sclk;
reg s_rst_n;
reg in_line_vaild;

reg [7:0] din;

wire[7:0] taps0x;
wire [7:0] taps1x;
wire [7:0] taps2x;

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






shift_line_buffer	shift_line_buffer_inst(
					.line_clk			(sclk			),
					.s_rst_n		(s_rst_n		),
					.in_line_vaild	(in_line_vaild),//一直为高
					.din			(din			),
					.vsync(vsync),
					.taps0x			(taps0x			),
					.taps1x			(taps1x			),
					.taps2x          (taps2x),
					.done(done)
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
