vlib work
vlog tb.v 

vsim -voptargs="+acc" work.tb

add wave -position insertpoint  \
sim:/tb/dut/clk \
sim:/tb/dut/rst \
sim:/tb/dut/rd \
sim:/tb/dut/rd_data \
sim:/tb/dut/alu_result \
sim:/tb/dut/pc_out \
sim:/tb/dut/wd \
sim:/tb/dut/alucontrol \
sim:/tb/dut/zero \
sim:/tb/dut/memtoreg \
sim:/tb/dut/memwrite \
sim:/tb/dut/pcsrc \
sim:/tb/dut/alusrc \
sim:/tb/dut/regdst \
sim:/tb/dut/regwrite\
sim:/tb/dut/data/src_a \
sim:/tb/dut/data/src_b
run -all
