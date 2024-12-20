onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group top -radix hexadecimal /test_neoRNG/clk
add wave -noupdate -expand -group top -radix hexadecimal /test_neoRNG/rst
add wave -noupdate -expand -group top -radix hexadecimal /test_neoRNG/enable_i
add wave -noupdate -expand -group top -radix hexadecimal /test_neoRNG/load
add wave -noupdate -expand -group top -radix hexadecimal /test_neoRNG/data_8
add wave -noupdate -expand -group top -radix hexadecimal /test_neoRNG/valid_o
add wave -noupdate -expand -group top -radix hexadecimal /test_neoRNG/data_o
add wave -noupdate -group RO /test_neoRNG/DUT/m1/clk
add wave -noupdate -group RO /test_neoRNG/DUT/m1/rst
add wave -noupdate -group RO /test_neoRNG/DUT/m1/enable_i
add wave -noupdate -group RO /test_neoRNG/DUT/m1/enable_o
add wave -noupdate -group RO /test_neoRNG/DUT/m1/rnd
add wave -noupdate -group RO /test_neoRNG/DUT/m1/enable_5_7
add wave -noupdate -group RO /test_neoRNG/DUT/m1/enable_7_9
add wave -noupdate -group RO /test_neoRNG/DUT/m1/random_o_5
add wave -noupdate -group RO /test_neoRNG/DUT/m1/random_o_7
add wave -noupdate -group RO /test_neoRNG/DUT/m1/random_o_9
add wave -noupdate -expand -group DeBaising /test_neoRNG/DUT/m2/clk
add wave -noupdate -expand -group DeBaising /test_neoRNG/DUT/m2/rst
add wave -noupdate -expand -group DeBaising /test_neoRNG/DUT/m2/enable
add wave -noupdate -expand -group DeBaising /test_neoRNG/DUT/m2/rnd
add wave -noupdate -expand -group DeBaising /test_neoRNG/DUT/m2/valid
add wave -noupdate -expand -group DeBaising /test_neoRNG/DUT/m2/data
add wave -noupdate -expand -group DeBaising /test_neoRNG/DUT/m2/Q_1
add wave -noupdate -expand -group DeBaising /test_neoRNG/DUT/m2/Q_2
add wave -noupdate -expand -group DeBaising /test_neoRNG/DUT/m2/D_3
add wave -noupdate -expand -group DeBaising /test_neoRNG/DUT/m2/toggle
add wave -noupdate -expand -group Sampling -radix hexadecimal /test_neoRNG/DUT/m3/clk
add wave -noupdate -expand -group Sampling -radix hexadecimal /test_neoRNG/DUT/m3/rst
add wave -noupdate -expand -group Sampling -radix hexadecimal /test_neoRNG/DUT/m3/load
add wave -noupdate -expand -group Sampling -radix hexadecimal /test_neoRNG/DUT/m3/enable
add wave -noupdate -expand -group Sampling -radix hexadecimal /test_neoRNG/DUT/m3/valid
add wave -noupdate -expand -group Sampling -radix hexadecimal /test_neoRNG/DUT/m3/data
add wave -noupdate -expand -group Sampling -radix hexadecimal /test_neoRNG/DUT/m3/data_8
add wave -noupdate -expand -group Sampling -radix hexadecimal /test_neoRNG/DUT/m3/valid_o
add wave -noupdate -expand -group Sampling -radix hexadecimal /test_neoRNG/DUT/m3/data_o
add wave -noupdate -expand -group Sampling -radix hexadecimal /test_neoRNG/DUT/m3/count
add wave -noupdate -expand -group Sampling -radix hexadecimal /test_neoRNG/DUT/m3/sclr
add wave -noupdate -expand -group Sampling -radix hexadecimal /test_neoRNG/DUT/m3/data_out
add wave -noupdate -expand -group Sampling -radix hexadecimal /test_neoRNG/DUT/m3/data_1_i
add wave -noupdate -group Ro_5 /test_neoRNG/DUT/m1/RO_5/clk
add wave -noupdate -group Ro_5 /test_neoRNG/DUT/m1/RO_5/rst
add wave -noupdate -group Ro_5 /test_neoRNG/DUT/m1/RO_5/enable_i
add wave -noupdate -group Ro_5 /test_neoRNG/DUT/m1/RO_5/enable_o
add wave -noupdate -group Ro_5 /test_neoRNG/DUT/m1/RO_5/random_o
add wave -noupdate -group Ro_5 /test_neoRNG/DUT/m1/RO_5/Q_1
add wave -noupdate -group Ro_5 /test_neoRNG/DUT/m1/RO_5/Q_2
add wave -noupdate -group Ro_5 /test_neoRNG/DUT/m1/RO_5/Q_3
add wave -noupdate -group Ro_5 /test_neoRNG/DUT/m1/RO_5/Q_4
add wave -noupdate -group Ro_5 /test_neoRNG/DUT/m1/RO_5/Q_5
add wave -noupdate -group Ro_5 /test_neoRNG/DUT/m1/RO_5/Q_EN_1
add wave -noupdate -group Ro_5 /test_neoRNG/DUT/m1/RO_5/Q_EN_2
add wave -noupdate -group Ro_5 /test_neoRNG/DUT/m1/RO_5/Q_EN_3
add wave -noupdate -group Ro_5 /test_neoRNG/DUT/m1/RO_5/Q_EN_4
add wave -noupdate -group Ro_5 /test_neoRNG/DUT/m1/RO_5/Q_EN_5
add wave -noupdate -group Ro_5 /test_neoRNG/DUT/m1/RO_5/Syn_1
add wave -noupdate -group Ro_5 /test_neoRNG/DUT/m1/RO_5/Syn_2
add wave -noupdate -group Ro_5 /test_neoRNG/DUT/m1/RO_5/Syn_3
add wave -noupdate -group Ro_5 /test_neoRNG/DUT/m1/RO_5/Syn_4
add wave -noupdate -group Ro7 /test_neoRNG/DUT/m1/RO_7/clk
add wave -noupdate -group Ro7 /test_neoRNG/DUT/m1/RO_7/rst
add wave -noupdate -group Ro7 /test_neoRNG/DUT/m1/RO_7/enable_i
add wave -noupdate -group Ro7 /test_neoRNG/DUT/m1/RO_7/enable_o
add wave -noupdate -group Ro7 /test_neoRNG/DUT/m1/RO_7/random_o
add wave -noupdate -group Ro7 /test_neoRNG/DUT/m1/RO_7/Q_1
add wave -noupdate -group Ro7 /test_neoRNG/DUT/m1/RO_7/Q_2
add wave -noupdate -group Ro7 /test_neoRNG/DUT/m1/RO_7/Q_3
add wave -noupdate -group Ro7 /test_neoRNG/DUT/m1/RO_7/Q_4
add wave -noupdate -group Ro7 /test_neoRNG/DUT/m1/RO_7/Q_5
add wave -noupdate -group Ro7 /test_neoRNG/DUT/m1/RO_7/Q_6
add wave -noupdate -group Ro7 /test_neoRNG/DUT/m1/RO_7/Q_7
add wave -noupdate -group Ro7 /test_neoRNG/DUT/m1/RO_7/Q_EN_1
add wave -noupdate -group Ro7 /test_neoRNG/DUT/m1/RO_7/Q_EN_2
add wave -noupdate -group Ro7 /test_neoRNG/DUT/m1/RO_7/Q_EN_3
add wave -noupdate -group Ro7 /test_neoRNG/DUT/m1/RO_7/Q_EN_4
add wave -noupdate -group Ro7 /test_neoRNG/DUT/m1/RO_7/Q_EN_5
add wave -noupdate -group Ro7 /test_neoRNG/DUT/m1/RO_7/Q_EN_6
add wave -noupdate -group Ro7 /test_neoRNG/DUT/m1/RO_7/Q_EN_7
add wave -noupdate -group Ro7 /test_neoRNG/DUT/m1/RO_7/Syn_1
add wave -noupdate -group Ro7 /test_neoRNG/DUT/m1/RO_7/Syn_2
add wave -noupdate -group Ro9 /test_neoRNG/DUT/m1/RO_9/clk
add wave -noupdate -group Ro9 /test_neoRNG/DUT/m1/RO_9/rst
add wave -noupdate -group Ro9 /test_neoRNG/DUT/m1/RO_9/enable_i
add wave -noupdate -group Ro9 /test_neoRNG/DUT/m1/RO_9/enable_o
add wave -noupdate -group Ro9 /test_neoRNG/DUT/m1/RO_9/random_o
add wave -noupdate -group Ro9 /test_neoRNG/DUT/m1/RO_9/Q_1
add wave -noupdate -group Ro9 /test_neoRNG/DUT/m1/RO_9/Q_2
add wave -noupdate -group Ro9 /test_neoRNG/DUT/m1/RO_9/Q_3
add wave -noupdate -group Ro9 /test_neoRNG/DUT/m1/RO_9/Q_4
add wave -noupdate -group Ro9 /test_neoRNG/DUT/m1/RO_9/Q_5
add wave -noupdate -group Ro9 /test_neoRNG/DUT/m1/RO_9/Q_6
add wave -noupdate -group Ro9 /test_neoRNG/DUT/m1/RO_9/Q_7
add wave -noupdate -group Ro9 /test_neoRNG/DUT/m1/RO_9/Q_8
add wave -noupdate -group Ro9 /test_neoRNG/DUT/m1/RO_9/Q_9
add wave -noupdate -group Ro9 /test_neoRNG/DUT/m1/RO_9/Q_EN_1
add wave -noupdate -group Ro9 /test_neoRNG/DUT/m1/RO_9/Q_EN_2
add wave -noupdate -group Ro9 /test_neoRNG/DUT/m1/RO_9/Q_EN_3
add wave -noupdate -group Ro9 /test_neoRNG/DUT/m1/RO_9/Q_EN_4
add wave -noupdate -group Ro9 /test_neoRNG/DUT/m1/RO_9/Q_EN_5
add wave -noupdate -group Ro9 /test_neoRNG/DUT/m1/RO_9/Q_EN_6
add wave -noupdate -group Ro9 /test_neoRNG/DUT/m1/RO_9/Q_EN_7
add wave -noupdate -group Ro9 /test_neoRNG/DUT/m1/RO_9/Q_EN_8
add wave -noupdate -group Ro9 /test_neoRNG/DUT/m1/RO_9/Q_EN_9
add wave -noupdate -group ff1 /test_neoRNG/DUT/m1/RO_5/FF_1/D
add wave -noupdate -group ff1 /test_neoRNG/DUT/m1/RO_5/FF_1/clk
add wave -noupdate -group ff1 /test_neoRNG/DUT/m1/RO_5/FF_1/rst
add wave -noupdate -group ff1 /test_neoRNG/DUT/m1/RO_5/FF_1/Q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {49 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 238
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {709 ps}
