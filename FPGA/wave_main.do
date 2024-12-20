onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group M00 -radix unsigned /main/P0/M0/clk
add wave -noupdate -expand -group M00 -radix unsigned /main/P0/M0/reset
add wave -noupdate -expand -group M00 -radix unsigned /main/P0/M0/prob_A
add wave -noupdate -expand -group M00 -radix unsigned /main/P0/M0/prob_C
add wave -noupdate -expand -group M00 -radix unsigned /main/P0/M0/prob_G
add wave -noupdate -expand -group M00 -radix unsigned /main/P0/M0/prob_T
add wave -noupdate -expand -group M00 -radix unsigned /main/P0/M0/instance_ID
add wave -noupdate -expand -group M00 -radix unsigned /main/P0/M0/result
add wave -noupdate -expand -group M00 -radix unsigned /main/P0/M0/random_val
add wave -noupdate -expand -group M00 -radix unsigned /main/P0/M0/probability_A
add wave -noupdate -expand -group M00 -radix unsigned /main/P0/M0/probability_C
add wave -noupdate -expand -group M00 -radix unsigned /main/P0/M0/probability_G
add wave -noupdate -expand -group M00 -radix unsigned /main/P0/M0/probability_T
add wave -noupdate -expand -group M00 -radix unsigned /main/P0/M0/seed
add wave -noupdate -expand -group Ran00 -radix unsigned /main/P0/M0/Raninst/clk
add wave -noupdate -expand -group Ran00 -radix unsigned /main/P0/M0/Raninst/reset
add wave -noupdate -expand -group Ran00 -radix unsigned /main/P0/M0/Raninst/seed
add wave -noupdate -expand -group Ran00 -radix unsigned /main/P0/M0/Raninst/sum
add wave -noupdate -expand -group Ran00 -radix unsigned /main/P0/M0/Raninst/random_output
add wave -noupdate -expand -group Ran00 -radix unsigned /main/P0/M0/Raninst/rand_val
add wave -noupdate -expand -group lfsr00 -radix unsigned /main/P0/M0/Raninst/lfsr_inst/clk
add wave -noupdate -expand -group lfsr00 -radix unsigned /main/P0/M0/Raninst/lfsr_inst/reset
add wave -noupdate -expand -group lfsr00 -radix unsigned /main/P0/M0/Raninst/lfsr_inst/seed
add wave -noupdate -expand -group lfsr00 -radix unsigned /main/P0/M0/Raninst/lfsr_inst/rand_val
add wave -noupdate -expand -group lfsr00 -radix unsigned /main/P0/M0/Raninst/lfsr_inst/feedback_0
add wave -noupdate -expand -group lfsr00 -radix unsigned /main/P0/M0/Raninst/lfsr_inst/feedback_1
add wave -noupdate -expand -group lfsr00 -radix unsigned /main/P0/M0/Raninst/lfsr_inst/feedback_2
add wave -noupdate -expand -group lfsr00 -radix unsigned /main/P0/M0/Raninst/lfsr_inst/first
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {50 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 277
configure wave -valuecolwidth 52
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
WaveRestoreZoom {0 ps} {425 ps}
