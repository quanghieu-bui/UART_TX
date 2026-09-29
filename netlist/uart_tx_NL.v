
module uart_tx ( clk, rst_n, tx_start, tx_data, tx, tx_busy );
  input [7:0] tx_data;
  input clk, rst_n, tx_start;
  output tx, tx_busy;
  wire   N15, N16, N17, N38, N65, N66, N67, N68, N69, N70, n21, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77;
  wire   [1:0] state;
  wire   [3:0] clk_count;
  wire   [7:0] data_reg;

  DFFARX1 \bit_index_reg[0]  ( .D(n67), .CLK(clk), .RSTB(rst_n), .Q(N15), .QN(
        n27) );
  DFFARX1 \bit_index_reg[1]  ( .D(n63), .CLK(clk), .RSTB(rst_n), .Q(N16) );
  DFFARX1 \bit_index_reg[2]  ( .D(n66), .CLK(clk), .RSTB(rst_n), .Q(N17) );
  DFFARX1 \state_reg[0]  ( .D(n64), .CLK(clk), .RSTB(rst_n), .Q(state[0]) );
  DFFARX1 \state_reg[1]  ( .D(n65), .CLK(clk), .RSTB(rst_n), .Q(state[1]), 
        .QN(n21) );
  DFFARX1 \clk_count_reg[0]  ( .D(N67), .CLK(clk), .RSTB(rst_n), .Q(
        clk_count[0]) );
  DFFARX1 \clk_count_reg[1]  ( .D(N68), .CLK(clk), .RSTB(rst_n), .Q(
        clk_count[1]), .QN(n26) );
  DFFARX1 \clk_count_reg[2]  ( .D(N69), .CLK(clk), .RSTB(rst_n), .Q(
        clk_count[2]), .QN(n25) );
  DFFARX1 \clk_count_reg[3]  ( .D(N70), .CLK(clk), .RSTB(rst_n), .Q(
        clk_count[3]) );
  DFFARX1 \data_reg_reg[7]  ( .D(n62), .CLK(clk), .RSTB(rst_n), .Q(data_reg[7]) );
  DFFARX1 \data_reg_reg[6]  ( .D(n61), .CLK(clk), .RSTB(rst_n), .Q(data_reg[6]) );
  DFFARX1 \data_reg_reg[5]  ( .D(n60), .CLK(clk), .RSTB(rst_n), .Q(data_reg[5]) );
  DFFARX1 \data_reg_reg[4]  ( .D(n59), .CLK(clk), .RSTB(rst_n), .Q(data_reg[4]) );
  DFFARX1 \data_reg_reg[3]  ( .D(n58), .CLK(clk), .RSTB(rst_n), .Q(data_reg[3]) );
  DFFARX1 \data_reg_reg[2]  ( .D(n57), .CLK(clk), .RSTB(rst_n), .Q(data_reg[2]) );
  DFFARX1 \data_reg_reg[1]  ( .D(n56), .CLK(clk), .RSTB(rst_n), .Q(data_reg[1]) );
  DFFARX1 \data_reg_reg[0]  ( .D(n55), .CLK(clk), .RSTB(rst_n), .Q(data_reg[0]) );
  DFFASX1 tx_reg ( .D(N65), .CLK(clk), .SETB(rst_n), .Q(tx) );
  DFFARX1 tx_busy_reg ( .D(N66), .CLK(clk), .RSTB(rst_n), .Q(tx_busy) );
  AO22X1 U29 ( .IN1(tx_data[0]), .IN2(n71), .IN3(data_reg[0]), .IN4(n28), .Q(
        n55) );
  AO22X1 U30 ( .IN1(tx_data[1]), .IN2(n71), .IN3(data_reg[1]), .IN4(n28), .Q(
        n56) );
  AO22X1 U31 ( .IN1(tx_data[2]), .IN2(n71), .IN3(data_reg[2]), .IN4(n28), .Q(
        n57) );
  AO22X1 U32 ( .IN1(tx_data[3]), .IN2(n71), .IN3(data_reg[3]), .IN4(n28), .Q(
        n58) );
  AO22X1 U33 ( .IN1(tx_data[4]), .IN2(n71), .IN3(data_reg[4]), .IN4(n28), .Q(
        n59) );
  AO22X1 U34 ( .IN1(tx_data[5]), .IN2(n71), .IN3(data_reg[5]), .IN4(n28), .Q(
        n60) );
  AO22X1 U35 ( .IN1(tx_data[6]), .IN2(n71), .IN3(data_reg[6]), .IN4(n28), .Q(
        n61) );
  AO22X1 U36 ( .IN1(tx_data[7]), .IN2(n71), .IN3(data_reg[7]), .IN4(n28), .Q(
        n62) );
  AO21X1 U37 ( .IN1(N16), .IN2(n29), .IN3(n30), .Q(n63) );
  NOR4X0 U38 ( .IN1(N16), .IN2(n31), .IN3(n27), .IN4(n72), .QN(n30) );
  AO22X1 U39 ( .IN1(n70), .IN2(state[0]), .IN3(n33), .IN4(n34), .Q(n64) );
  AO22X1 U40 ( .IN1(n70), .IN2(state[1]), .IN3(n35), .IN4(n34), .Q(n65) );
  AO21X1 U41 ( .IN1(n77), .IN2(n36), .IN3(n71), .Q(n34) );
  NAND3X0 U42 ( .IN1(n37), .IN2(n38), .IN3(n39), .QN(n36) );
  NAND4X0 U43 ( .IN1(n32), .IN2(N16), .IN3(N15), .IN4(n73), .QN(n43) );
  OAI21X1 U44 ( .IN1(n29), .IN2(n32), .IN3(N17), .QN(n42) );
  AO21X1 U45 ( .IN1(n32), .IN2(n27), .IN3(n31), .Q(n29) );
  AO22X1 U46 ( .IN1(n31), .IN2(N15), .IN3(n44), .IN4(n32), .Q(n67) );
  AND3X1 U47 ( .IN1(N16), .IN2(N15), .IN3(N17), .Q(n40) );
  OA21X1 U48 ( .IN1(n45), .IN2(n76), .IN3(n74), .Q(n31) );
  XNOR2X1 U49 ( .IN1(clk_count[3]), .IN2(n48), .Q(n46) );
  XOR2X1 U50 ( .IN1(n49), .IN2(clk_count[2]), .Q(n50) );
  XOR2X1 U51 ( .IN1(n26), .IN2(clk_count[0]), .Q(n51) );
  AO21X1 U52 ( .IN1(n75), .IN2(n38), .IN3(n77), .Q(n47) );
  NAND3X0 U53 ( .IN1(n52), .IN2(n28), .IN3(n75), .QN(N66) );
  OR2X1 U54 ( .IN1(n38), .IN2(n77), .Q(n52) );
  NAND4X0 U55 ( .IN1(clk_count[3]), .IN2(clk_count[0]), .IN3(n26), .IN4(n25), 
        .QN(n45) );
  NAND3X0 U56 ( .IN1(n74), .IN2(n38), .IN3(n54), .QN(N65) );
  INVX0 U57 ( .INP(n34), .ZN(n70) );
  INVX0 U58 ( .INP(n35), .ZN(n75) );
  NAND2X1 U59 ( .IN1(n40), .IN2(n41), .QN(n39) );
  INVX0 U60 ( .INP(n28), .ZN(n71) );
  INVX0 U61 ( .INP(n41), .ZN(n76) );
  NOR2X0 U62 ( .IN1(n76), .IN2(n40), .QN(n32) );
  INVX0 U63 ( .INP(n53), .ZN(n74) );
  INVX0 U64 ( .INP(n45), .ZN(n77) );
  NAND2X1 U65 ( .IN1(n37), .IN2(n76), .QN(n35) );
  NAND2X1 U66 ( .IN1(tx_start), .IN2(n53), .QN(n28) );
  NAND2X1 U67 ( .IN1(n76), .IN2(n74), .QN(n33) );
  NOR2X0 U68 ( .IN1(n21), .IN2(state[0]), .QN(n41) );
  NOR2X0 U69 ( .IN1(state[0]), .IN2(state[1]), .QN(n53) );
  NAND2X1 U70 ( .IN1(state[0]), .IN2(state[1]), .QN(n38) );
  NOR2X0 U71 ( .IN1(n46), .IN2(n47), .QN(N70) );
  NOR2X0 U72 ( .IN1(n49), .IN2(n25), .QN(n48) );
  NOR2X0 U73 ( .IN1(n50), .IN2(n47), .QN(N69) );
  NOR2X0 U74 ( .IN1(n51), .IN2(n47), .QN(N68) );
  NOR2X0 U75 ( .IN1(clk_count[0]), .IN2(n47), .QN(N67) );
  NAND2X1 U76 ( .IN1(state[0]), .IN2(n21), .QN(n37) );
  NAND2X1 U77 ( .IN1(clk_count[1]), .IN2(clk_count[0]), .QN(n49) );
  NAND2X1 U78 ( .IN1(N38), .IN2(n41), .QN(n54) );
  NAND2X1 U79 ( .IN1(n42), .IN2(n43), .QN(n66) );
  INVX0 U80 ( .INP(n31), .ZN(n73) );
  NOR2X0 U81 ( .IN1(N15), .IN2(n31), .QN(n44) );
  INVX0 U82 ( .INP(n32), .ZN(n72) );
  MUX41X1 U83 ( .IN1(data_reg[4]), .IN3(data_reg[6]), .IN2(data_reg[5]), .IN4(
        data_reg[7]), .S0(N16), .S1(N15), .Q(n68) );
  MUX41X1 U84 ( .IN1(data_reg[0]), .IN3(data_reg[2]), .IN2(data_reg[1]), .IN4(
        data_reg[3]), .S0(N16), .S1(N15), .Q(n69) );
  MUX21X1 U85 ( .IN1(n69), .IN2(n68), .S(N17), .Q(N38) );
endmodule

