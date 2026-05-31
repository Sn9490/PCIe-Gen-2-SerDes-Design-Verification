#vdel -all -lib work
vlib work
vlog\
+incdir+../packages/\
+incdir+../rtl/\
+incdir+../test/\
+incdir+../testbench/\
+incdir+ +acc +cover -coveropt 3 ../testbench/serdes_top.sv
vsim -coverage work.serdes_top -assertdebug +UVM_VERBOSITY=UVM_NONE +UVM_TESTNAME=serdes_test -l run.log
add wave /serdes_top/dut/label/a_1 /serdes_top/dut/label/a_2 /serdes_top/dut/label/a_3 /serdes_top/dut/label/a_4 /serdes_top/dut/label/a_5 /serdes_top/dut/label/a_6 /serdes_top/dut/label/a_7 /serdes_top/dut/label/a_8
run -all
add wave -position insertpoint sim:/serdes_top/dut/m5/*
add wave -position insertpoint sim:/serdes_top/dut/m3/*
add wave -position insertpoint sim:/serdes_top/dut/m1/*
add wave -position insertpoint sim:/serdes_top/dut/m2/*
add wave -position insertpoint sim:/serdes_top/dut/m4/*
add wave -position insertpoint sim:/serdes_top/dut/m6/*


