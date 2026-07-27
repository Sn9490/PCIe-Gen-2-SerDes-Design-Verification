# PCIe Gen-2 SerDes Design & Verification

![Verilog](https://img.shields.io/badge/Verilog-RTL-blue)
![SystemVerilog](https://img.shields.io/badge/SystemVerilog-HVL-blueviolet)
![UVM](https://img.shields.io/badge/UVM-Verification-green)
![PCIe Gen2](https://img.shields.io/badge/PCIe-Gen2-orange)
![SVA](https://img.shields.io/badge/SVA-Assertions-red)
![QuestaSim](https://img.shields.io/badge/QuestaSim-Simulator-blue)

---

# Project Overview

This project focuses on the **Design and Functional Verification of the PCIe Gen-2 Physical Layer SerDes Block**. The transmitter and receiver sub-blocks were implemented using **Verilog HDL**, and the complete verification environment was developed using the **Universal Verification Methodology (UVM)** in **SystemVerilog**.

The project helped in understanding PCIe architecture, protocol flow, Physical Layer communication, LTSSM, 8b/10b encoding, and verification methodologies used in ASIC/IP verification.

---

# HDL / HVL

- **HDL:** Verilog
- **HVL:** SystemVerilog
- **Verification Methodology:** UVM
- **EDA Tool:** QuestaSim

---

# Description

In the PCIe Gen-2 environment, the **Physical Layer SerDes** sub-blocks were designed and verified.

The transmitter consists of:

- Scrambler
- 8b/10b Encoder
- Parallel-In Serial-Out (PISO)

The receiver consists of:

- Serial-In Parallel-Out (SIPO)
- 8b/10b Decoder
- Descrambler

The RTL was implemented in **Verilog**, and functional verification was performed using a reusable **UVM-based verification environment**.

---

# Responsibilities

- Developed a reusable class-based verification environment using the **Universal Verification Methodology (UVM)**.

- Studied the PCIe architecture and understood data transfer through the three protocol layers:
  - Transaction Layer
  - Data Link Layer
  - Physical Layer

- Understood PCIe protocol concepts including:
  - PCIe Throughput
  - LTSSM (Link Training and Status State Machine)
  - TLP Routing
  - Types of TLPs
  - Types of DLLPs
  - Configuration Space (Type-0 and Type-1)
  - PIPE Interface
  - 8b/10b Encoding Technique

- Developed directed and constrained-random testcases to verify SerDes functionality.

- Developed functional coverage models and assertion plans.

- Performed simulation, waveform debugging, regression execution, and verification sign-off.

- Achieved **100% Functional Coverage**.

---

# Verification Environment

The reusable UVM verification environment includes:

- Sequence Item
- Sequence
- Sequencer
- Driver
- Monitor
- Agent
- Environment
- Scoreboard
- Coverage Collector
- Test

---

# Features Verified

- Scrambler functionality
- Descrambler functionality
- 8b/10b Encoder
- 8b/10b Decoder
- PISO operation
- SIPO operation
- Data integrity
- LTSSM functionality
- Protocol compliance
- Functional coverage

---

# Tools Used

- Verilog HDL
- SystemVerilog
- UVM
- QuestaSim

---

# Results

- Successfully designed the PCIe Gen-2 Physical Layer SerDes RTL.
- Developed a reusable UVM verification environment.
- Verified transmitter and receiver functionality.
- Achieved **100% Functional Coverage**.
- Successfully completed functional verification sign-off.

---

# Repository Structure

```text
PCIe-Gen2-SerDes-Design-Verification
│
├── RTL
│   ├── Scrambler.v
│   ├── Encoder.v
│   ├── PISO.v
│   ├── SIPO.v
│   ├── Decoder.v
│   └── Descrambler.v
│
├── UVM
│   ├── sequence_item.sv
│   ├── sequence.sv
│   ├── sequencer.sv
│   ├── driver.sv
│   ├── monitor.sv
│   ├── agent.sv
│   ├── scoreboard.sv
│   ├── env.sv
│   ├── test.sv
│   └── coverage.sv
│
├── Simulation
│
├── Waveforms
│
└── README.md
```

---

# Author

**Guru Naveen Reddy Siddu**

📧 Email: gurunaveenreddys@gmail.com

🔗 LinkedIn: https://www.linkedin.com/in/siddu-guru-naveen-reddy-93b597282
