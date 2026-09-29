create_clock -name CLK -period 10.0 [get_ports clk]

set_input_delay 1.0 -clock CLK [get_ports {rst_n tx_start tx_data[*]}]

set_output_delay 1.0 -clock CLK [get_ports {tx tx_busy}]

set_clock_uncertainty 0.2 [get_clocks CLK]

set_max_fanout 16 [current_design]

set_max_transition 1.0 [current_design]
