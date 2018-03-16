`timescale 1ns/1ns

module tb_Fast_median_filter;

reg sclk;
reg s_rst_n;
reg in_line_vaild;

reg [7:0] din;

wire		dout_flag;
wire[7:0]	median;
reg [7:0] mem_a[130559:0];//480*272=130560-----13bit
//------------- generate system signals ------------------------------------
initial begin
	sclk = 1;
	s_rst_n <= 0;
	din<='d0;
in_line_vaild<=0;
#100
	s_rst_n <= 1;
	#100

	data_generate();
end

always #10 sclk = ~sclk;

initial $readmemh("./1.txt", mem_a);
//initial $readmemh("./test.txt", mem_a);
//initial $readmemh("./1.txt", mem_a);
//modelsim仿真wave中数据变量导出到txt文档

reg [17:0] i =0;  
always @ (posedge sclk)  
begin  
    if (!s_rst_n)  
        i <=0;  
   else if (i<130559 && dout_flag==1) 
   //else if (i<47 && dout_flag==1) 
        i <= i+1;  
    else  
        i<= 0;  
end  
      
  
integer w_file;  
    initial w_file = $fopen("data_out_1.txt");  
    always @(i)  
    begin  
		
        $fdisplay(w_file,"%d",median); 
	if (i == 17'd130559)    //  
	//if (i == 17'd47) 
            $stop; 
 
 
    end 
	
//modelsim仿真wave中数据变量导出到txt文档

Fast_median_filter	Fast_median_filter_inst(
				.din			(din			),
				.data_valuable	(in_line_vaild),
				.sclk			(sclk			),
				.s_rst_n		(s_rst_n		),
				.vsync			(vsync			),
				
				.median			(median			),
				.dout_flag      (dout_flag    )
);

task data_generate();
integer i;
begin
for(i=0; i<130560; i=i+1) begin
//for(i=0; i<50; i=i+1) begin
	 #20 
	 in_line_vaild <= 1'b1;
	 din<=mem_a[i];
	 //#20 din<=din+1;
	 end
	 in_line_vaild<=0;
end
endtask

endmodule
