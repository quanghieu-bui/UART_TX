# UART TX — ASIC Physical Design Full Flow

A UART Transmitter implemented in SystemVerilog and taken through a complete ASIC physical design flow using Synopsys tools.

---

## 1. Project Overview

This project demonstrates the implementation of a UART Transmitter from RTL design to physical implementation.

The complete ASIC design flow includes:

**RTL → Simulation → SDC → Synthesis → Floorplan → Placement → CTS → Routing → STA → GDS**

The design was implemented using a **90 nm standard-cell technology library**.

---

## 2. Design Flow

```text
RTL Design
    │
    ▼
VCS Simulation
    │
    ▼
SDC Timing Constraints
    │
    ▼
Design Compiler
    │
    ├── Logic Synthesis
    ├── Area Analysis
    └── Timing Analysis
    │
    ▼
IC Compiler
    │
    ├── Floorplanning
    ├── Placement
    ├── Clock Tree Synthesis
    └── Routing
    │
    ▼
PrimeTime
    │
    ├── Setup Analysis
    └── Hold Analysis
    │
    ▼
Final GDS
```

---

## 3. RTL Design

The UART Transmitter is described using SystemVerilog RTL.

Main RTL source:

```text
rtl/uart_tx.sv
```

The design was verified using a dedicated testbench:

```text
rtl/tb_uart_tx.sv
```

Top-level module:

```text
uart_tx
```

---

## 4. RTL Simulation

RTL simulation was performed using **Synopsys VCS**.

The testbench verifies the functional behavior of the UART Transmitter before synthesis.

### Simulation Waveform

![RTL Simulation Waveform](pic/Picture1.png)

---

## 5. Logic Synthesis

Logic synthesis was performed using **Synopsys Design Compiler**.

The RTL was synthesized into a gate-level netlist using the SAED 90 nm standard-cell library.

### Gate-Level Schematic

![Schematic](pic/Picture0.webp)

![Floorplan](pic/Picture3.png)

### Area Report

![Area Report](pic/Picture2.png)

### Timing Report

![Timing Report](pic/Picture4.png)

Generated netlist:

```text
netlist/uart_tx_NL.v
```

---

## 6. Physical Design

Physical implementation was performed using **Synopsys IC Compiler**.

### Floorplanning

A core utilization of approximately **70%** was used for the initial floorplan.

![Floorplan](pic/Picture5.png)

---

### Placement

Standard cells were placed inside the core area while considering timing and routing constraints.

![Placement](pic/Picture6.png)

---

### Clock Tree Synthesis

Clock Tree Synthesis (CTS) was performed to distribute the clock signal across the design.

![Clock Tree Synthesis](pic/Picture.png)

After CTS:

| Parameter                   |   Result |
| --------------------------- | -------: |
| Clock Period                |    10 ns |
| Setup Slack                 | +8.33 ns |
| TNS                         |     0 ns |
| Violating Paths             |        0 |
| Hold Violation              |        0 |
| Leaf Cells                  |       76 |
| Clock Buffer/Inverter Cells |        0 |

---

### Routing

Global and detailed routing were performed using IC Compiler.

After routing:

| Parameter              |   Result |
| ---------------------- | -------: |
| Setup Slack            | +8.33 ns |
| Total Negative Slack   |     0 ns |
| Violating Paths        |        0 |
| Routing Net Violations |        0 |
| Total Nets             |       91 |
| Wire Length            |  1926 µm |

![Routing](pic/Picture7.png)

---

## 7. Physical Verification

Route verification was performed using the IC Compiler `verify_zrt_route` command.

The verification reported:

| Parameter      | Result |
| -------------- | -----: |
| DRC Violations |      0 |
| Open Nets      |      0 |
| Routing Errors |      0 |

![PV](pic/Picture8.png)

> Note: Antenna checking was not performed because antenna rules were not defined in the available technology setup.

---

## 8. Static Timing Analysis

Static Timing Analysis was performed using **Synopsys PrimeTime**.

### Setup Analysis

Worst reported setup slack:

```text
+8.42 ns
```

### Hold Analysis

Worst reported hold slack:

```text
+0.03 ns
```

PrimeTime reports:

```text
pt/reports/setup.rpt
pt/reports/hold.rpt
```

---

## 9. Final Layout

The final routed design was exported as a **GDSII** file.

```text
uart_tx.gds
```

### Final Layout

![Final Layout](pic/layout.png)

---

## 10. Key Results

| Parameter              |     Result |
| ---------------------- | ---------: |
| Technology             | SAED 90 nm |
| Clock Period           |      10 ns |
| Clock Frequency        |    100 MHz |
| Core Utilization       |       ~70% |
| Leaf Cells             |         76 |
| Total Nets             |         91 |
| Cell Area              |    1110.53 |
| Design Area            |    1146.98 |
| CTS Setup Slack        |   +8.33 ns |
| CTS Hold Violation     |          0 |
| Routed Setup Slack     |   +8.33 ns |
| Total Negative Slack   |          0 |
| Routing Net Violations |          0 |
| DRC Violations         |          0 |
| Open Nets              |          0 |
| PT Setup Slack         |   +8.42 ns |
| PT Hold Slack          |   +0.03 ns |

---

## 11. Tools

| Design Stage           | Tool                     |
| ---------------------- | ------------------------ |
| RTL Design             | SystemVerilog            |
| Simulation             | Synopsys VCS / DVE       |
| Logic Synthesis        | Synopsys Design Compiler |
| Physical Design        | Synopsys IC Compiler     |
| Static Timing Analysis | Synopsys PrimeTime       |
| Final Layout           | GDSII                    |

---

## 12. Project Structure

```text
UART_TX/
├── rtl/
│   └── uart_tx.sv
│
├── sim/
│   └── tb_uart_tx.sv
│
├── constraints/
│   └── uart_tx.sdc
│
├── dc/
│   ├── run_dc.tcl
│   └── reports/
│       ├── area.rpt
│       ├── timing.rpt
│       ├── constraint.rpt
│       └── check_design.rpt
│
├── icc/
│   └── reports/
│       ├── placement_qor.rpt
│       ├── placement_utilization.rpt
│       ├── cts_qor.rpt
│       └── routing_qor.rpt
│
├── pt/
│   └── reports/
│       ├── setup.rpt
│       └── hold.rpt
│
├── netlist/
│   └── uart_tx_NL.v
│
├── final/
│   └── uart_tx.gds
│
├── pic/
│   ├── Picture1.png
│   ├── Picture2.png
│   ├── Picture3.png
│   ├── Picture4.png
│   ├── Picture5.png
│   ├── Picture6.png
│   ├── Picture7.png
│   ├── Picture8.png
│   ├── PV.png
│   └── layout.png
│
├── README.md
└── .gitignore
```

---

## 13. Project Objective

The purpose of this project is to demonstrate practical experience with a complete ASIC digital implementation flow, including:

* RTL design
* Functional simulation
* Timing constraint development
* Logic synthesis
* Floorplanning
* Standard-cell placement
* Clock tree synthesis
* Routing
* Physical verification
* Static timing analysis
* GDSII generation
