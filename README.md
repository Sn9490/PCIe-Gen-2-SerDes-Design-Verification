<div align="center">

# 🛰️ PCIe Gen-2 SerDes — Design & Verification

### Physical Layer SerDes Block | UVM-Based Functional Verification

![Verilog](https://img.shields.io/badge/HDL-Verilog-0088CE?style=for-the-badge)
![SystemVerilog](https://img.shields.io/badge/HVL-SystemVerilog-1E88E5?style=for-the-badge)
![UVM](https://img.shields.io/badge/Methodology-UVM-FF6F00?style=for-the-badge)
![QuestaSim](https://img.shields.io/badge/Tool-QuestaSim-005A9C?style=for-the-badge)
![Coverage](https://img.shields.io/badge/Functional_Coverage-100%25-brightgreen?style=for-the-badge)

</div>

---

## 📖 Overview

This project implements and verifies the **Physical Layer SerDes sub-block** of the **PCIe Gen-2** protocol. The design covers both the transmit and receive data paths of the SerDes, built in Verilog and verified using a class-based **UVM** testbench.

- **Transmitter path:** Scrambler → 8b/10b Encoder → PISO (Parallel-In Serial-Out)
- **Receiver path:** SIPO (Serial-In Parallel-Out) → 8b/10b Decoder → Descrambler

## 🧩 Design Blocks

| Block | Function |
|---|---|
| **Scrambler** | Randomizes the data stream to reduce EMI and maintain signal integrity |
| **8b/10b Encoder** | Encodes 8-bit data into 10-bit symbols for DC balance and clock recovery |
| **PISO** | Converts parallel encoded data into a serial bitstream for transmission |
| **SIPO** | Converts the received serial bitstream back into parallel data |
| **8b/10b Decoder** | Decodes 10-bit symbols back into the original 8-bit data |
| **Descrambler** | Reverses the scrambling operation to recover the original data |

## 🏗️ Verification Environment

Built a **class-based UVM testbench** with the standard verification component hierarchy:

```
uvm_test
 └── uvm_env
      ├── agent (active)
      │    ├── sequencer
      │    ├── driver
      │    └── monitor
      ├── scoreboard
      └── coverage collector
```

**Key verification concepts applied:**
- Understood the 3-layer PCIe architecture (Transaction Layer, Data Link Layer, Physical Layer) and how data flows through each
- Studied PCIe throughput, LTSSM (Link Training and Status State Machine), TLP routing & TLP types, DLLP types, and Type 0 / Type 1 configuration space
- Focused verification scope on the Gen-2 Physical Layer's 8b/10b encoding scheme
- Developed functional coverage models and an assertion plan for protocol compliance
- Used the Pipe Interface as the design boundary for the SerDes block

## ✅ Verification Results

| Metric | Result |
|---|---|
| Functional Coverage | **100%** |
| Verification Sign-off | ✅ Achieved |
| Simulation Tool | QuestaSim |

## 🛠️ Tools & Technologies

- **HDL:** Verilog
- **HVL:** SystemVerilog
- **Methodology:** UVM (Universal Verification Methodology)
- **Simulator:** QuestaSim
- **Version Control:** Git

## 📂 Repository Structure

```
├── rtl/            # Verilog RTL source (Scrambler, Encoder, PISO, SIPO, Decoder, Descrambler)
├── tb/              # UVM testbench (agents, sequences, scoreboard, env, tests)
├── sim/             # Simulation scripts and QuestaSim run files
├── docs/            # Verification plan, coverage reports
└── README.md
```
<!-- Update this structure to match your actual repo layout -->

## 🚀 How to Run

```bash
# Example QuestaSim flow — update commands to match your scripts
vlib work
vlog -f filelist.f
vsim -c work.tb_top -do "run -all"
```
<!-- Replace with your actual simulation commands / Makefile targets -->

## 👤 Author

**Guru Naveen Reddy** — ASIC Design Verification Engineer
[LinkedIn](https://www.linkedin.com/in/siddu-guru-naveen-reddy-93b597282) · [GitHub](https://github.com/Sn9490) · gurunaveenreddys@gmail.com
