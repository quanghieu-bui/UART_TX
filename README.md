# UART TX — ASIC Full Design Flow

## Overview

This project implements a UART Transmitter in SystemVerilog and demonstrates a complete ASIC digital design flow:

**RTL → Simulation → SDC → Synthesis → Floorplan → Placement → CTS → Routing → DRC Verification → Static Timing Analysis → GDS**

The design was implemented using Synopsys VCS, Design Compiler, IC Compiler, and PrimeTime.

---


## Design Flow

### 1. RTL Design

The UART transmitter was described using SystemVerilog.

Main RTL source:

```text
rtl/uart_tx.sv
```

A dedicated testbench was used to verify the RTL functionality:

```text
rtl/tb_uart_tx.sv
```

---

### 2. RTL Simulation

Simulation was performed using **Synopsys VCS**.

The waveform can be analyzed using **DVE**.

![UART TX Simulation](pic/Picture1.png)

### 3. Timing Constraints

The design was constrained using Synopsys Design Constraints:

```text
constraints/uart_tx.sdc
```


### 4. Logic Synthesis

Logic synthesis was performed using **Synopsys Design Compiler**.

Main synthesis script:

```text
dc/run_dc.tcl
```

The synthesized gate-level netlist is:

```text
netlist/uart_tx_NL.v
```

Synthesis reports are available in:

```text
dc/reports/
```

including:

* Area report
* Timing report
* Constraint report
* Design checks

---

### 5. Physical Design — IC Compiler

The synthesized netlist was implemented using **Synopsys IC Compiler**.

The physical design flow includes:

```text
Floorplan
   ↓
Placement
   ↓
Clock Tree Synthesis
   ↓
Routing
   ↓
Route Verification
```

ICC reports are available in:

```text
icc/reports/
```

---

## Physical Design Results

### Placement

The placement stage achieved approximately:

```text
Utilization: 70%
```

Detailed results are available in:

```text
icc/reports/placement_qor.rpt
icc/reports/placement_utilization.rpt
```

### Clock Tree Synthesis

CTS was performed successfully with:

```text
Critical Path Slack: +8.33 ns
TNS: 0
Violating Paths: 0
Hold Violations: 0
```

CTS results:

```text
icc/reports/cts_qor.rpt
```

### Routing

After routing:

```text
Critical Path Slack: +8.33 ns
TNS: 0
Violating Paths: 0
Routing Violations: 0
```

The design contained:

```text
76 leaf cells
8 buffer/inverter cells
91 nets
```

Routing report:

```text
icc/reports/routing_qor.rpt
```

---

## Route Verification

IC Compiler route verification reported:

```text
Total DRC Violations: 0
Open Nets: 0
```

This result refers to the ICC `verify_zrt_route` check.

Antenna checking was not performed because the available technology setup did not define antenna rules.

---

## Static Timing Analysis

Static timing analysis was performed using **Synopsys PrimeTime**.

Reports:

```text
pt/reports/setup.rpt
pt/reports/hold.rpt
```

### Setup

Worst reported setup slack:

```text
+8.42 ns
```

### Hold

Worst reported hold slack:

```text
+0.03 ns
```

The reported setup and hold paths met their timing constraints.

---

## Final GDS

The final physical design was exported to GDSII:

```text
final/uart_tx.gds
```

The GDS represents the final routed physical implementation of the UART transmitter.

---

## Tools

| Stage           | Tool                     |
| --------------- | ------------------------ |
| RTL             | SystemVerilog            |
| Simulation      | Synopsys VCS / DVE       |
| Synthesis       | Synopsys Design Compiler |
| Physical Design | Synopsys IC Compiler     |
| STA             | Synopsys PrimeTime       |
| Layout Output   | GDSII                    |

---

## Key Results

| Metric                |   Result |
| --------------------- | -------: |
| Clock Period          |    10 ns |
| Clock Frequency       |  100 MHz |
| Leaf Cells            |       76 |
| Buffer/Inverter Cells |        8 |
| Total Nets            |       91 |
| Cell Area             |  1110.53 |
| Design Area           |  1146.98 |
| Routing DRC           |        0 |
| Open Nets             |        0 |
| Setup Slack           | +8.42 ns |
| Hold Slack            | +0.03 ns |

---

## Project Objective

The purpose of this project is to demonstrate practical experience with an ASIC digital implementation flow, including:

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

---

## Author

**Bui Quang Hieu**

Electronics and Telecommunications
IC Design Specialization
University of Science, VNU-HCM
