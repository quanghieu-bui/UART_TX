`timescale 1ns/1ps

module tb_uart_tx;

    logic       clk;
    logic       rst_n;
    logic       tx_start;
    logic [7:0] tx_data;
    logic       tx;
    logic       tx_busy;

    uart_tx #(
        .CLKS_PER_BIT(10)
    ) dut (
        .clk      (clk),
        .rst_n    (rst_n),
        .tx_start (tx_start),
        .tx_data  (tx_data),
        .tx        (tx),
        .tx_busy  (tx_busy)
    );

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        $vcdplusfile("uart_tx.vpd");
        $vcdpluson(0, tb_uart_tx);

        rst_n    = 1'b0;
        tx_start = 1'b0;
        tx_data  = 8'h00;

        #20;
        rst_n = 1'b1;

        #20;
        tx_data  = 8'hA5;
        tx_start = 1'b1;

        #10;
        tx_start = 1'b0;

        wait(tx_busy == 1'b0);

        #50;

        tx_data  = 8'h3C;
        tx_start = 1'b1;

        #10;
        tx_start = 1'b0;

        wait(tx_busy == 1'b0);

        #50;

        $finish;
    end

endmodule
