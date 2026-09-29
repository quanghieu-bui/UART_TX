`timescale 1ns/1ps

module uart_tx #(
    parameter integer CLKS_PER_BIT = 10
)(
    input  logic       clk,
    input  logic       rst_n,
    input  logic       tx_start,
    input  logic [7:0] tx_data,

    output logic       tx,
    output logic       tx_busy
);

    typedef enum logic [1:0] {
        IDLE  = 2'b00,
        START = 2'b01,
        DATA  = 2'b10,
        STOP  = 2'b11
    } state_t;

    state_t state;

    logic [$clog2(CLKS_PER_BIT)-1:0] clk_count;
    logic [2:0] bit_index;
    logic [7:0] data_reg;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state     <= IDLE;
            clk_count <= '0;
            bit_index <= '0;
            data_reg  <= '0;
            tx        <= 1'b1;
            tx_busy   <= 1'b0;
        end
        else begin
            case (state)

                IDLE: begin
                    tx        <= 1'b1;
                    tx_busy   <= 1'b0;
                    clk_count <= '0;
                    bit_index <= '0;

                    if (tx_start) begin
                        data_reg <= tx_data;
                        tx_busy  <= 1'b1;
                        state    <= START;
                    end
                end

                START: begin
                    tx      <= 1'b0;
                    tx_busy <= 1'b1;

                    if (clk_count == CLKS_PER_BIT-1) begin
                        clk_count <= '0;
                        state     <= DATA;
                    end
                    else begin
                        clk_count <= clk_count + 1'b1;
                    end
                end

                DATA: begin
                    tx      <= data_reg[bit_index];
                    tx_busy <= 1'b1;

                    if (clk_count == CLKS_PER_BIT-1) begin
                        clk_count <= '0;

                        if (bit_index == 3'd7) begin
                            bit_index <= '0;
                            state     <= STOP;
                        end
                        else begin
                            bit_index <= bit_index + 1'b1;
                        end
                    end
                    else begin
                        clk_count <= clk_count + 1'b1;
                    end
                end

                STOP: begin
                    tx      <= 1'b1;
                    tx_busy <= 1'b1;

                    if (clk_count == CLKS_PER_BIT-1) begin
                        clk_count <= '0;
                        state     <= IDLE;
                        tx_busy   <= 1'b0;
                    end
                    else begin
                        clk_count <= clk_count + 1'b1;
                    end
                end

                default: begin
                    state <= IDLE;
                    tx    <= 1'b1;
                end

            endcase
        end
    end

endmodule
