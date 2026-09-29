set_app_var search_path [list \
    /home/ltk/ASIC_LIB/Lib/syn_lib/syn_lib \
    /home/ltk/UART_TX/rtl
]

set_app_var target_library [list \
    /home/ltk/ASIC_LIB/Lib/syn_lib/syn_lib/saed90nm_typ.db
]

set_app_var link_library [list \
    "*" \
    /home/ltk/ASIC_LIB/Lib/syn_lib/syn_lib/saed90nm_typ.db
]

analyze -format sverilog /home/ltk/UART_TX/rtl/uart_tx.sv

elaborate uart_tx
current_design uart_tx

link

read_sdc /home/ltk/UART_TX/constraints/uart_tx.sdc

check_design > /home/ltk/UART_TX/dc/reports/check_design.rpt

compile

report_area > /home/ltk/UART_TX/dc/reports/area.rpt
report_timing > /home/ltk/UART_TX/dc/reports/timing.rpt
report_constraint -all_violators > /home/ltk/UART_TX/dc/reports/constraint.rpt

write -format verilog -hierarchy \
    -output /home/ltk/UART_TX/dc/output/uart_tx_syn.v

write -format ddc \
    -hierarchy \
    -output /home/ltk/UART_TX/dc/output/uart_tx_syn.ddc

quit
