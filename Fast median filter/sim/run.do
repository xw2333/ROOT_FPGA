quit -sim
.main clear
vlib work


vlog ./tb_Fast_median_filter.v
vlog ./../design/*.v
vlog ./../proj/Fast_median_filter/ipcore_dir/fifo_512x8.v
vlog ./xilinx_lib/*.v

vsim -voptargs=+acc tb_Fast_median_filter

view wave
view structure
view signals

add wave -divider {tb_Fast_median_filter}
add wave tb_Fast_median_filter/*

add wave -divider {fliter_window_inst}
add wave tb_Fast_median_filter/Fast_median_filter_inst/fliter_window_inst/*

add wave -divider {big_inst}
add wave tb_Fast_median_filter/Fast_median_filter_inst/big_inst/*



run 3000us