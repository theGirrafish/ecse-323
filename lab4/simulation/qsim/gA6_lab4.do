onerror {quit -f}
vlib work
vlog -work work gA6_lab4.vo
vlog -work work gA6_lab4.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.gA6_lab4_vlg_vec_tst
vcd file -direction gA6_lab4.msim.vcd
vcd add -internal gA6_lab4_vlg_vec_tst/*
vcd add -internal gA6_lab4_vlg_vec_tst/i1/*
add wave /*
run -all
