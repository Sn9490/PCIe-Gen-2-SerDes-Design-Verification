## PCIe Gen2 SerDes Design & Verification
In the Environment of PCle of Gen-2, we have implemented the Physical layer's Serdes block Sublayer (Transmitter block-Scrambler, Encoder, PISO and Receiver block-SIPO, Decoder, Descrambler) which is designed in Verilog and Verified in the UVM Methodology.


### Design

Implemented:
- Scrambler
- Descrambler
- 8b/10b Encoder
- 8b/10b Decoder
- PISO
- SIPO

### Verification

Developed reusable UVM environment:
- Sequencer
- Driver
- Monitor
- Scoreboard
- Coverage Collector


### Features Verified
- Encoding/Decoding Correctness
- Data Integrity
- LTSSM State Validation
- Error Injection Scenarios


## Tools
- QuestaSim
- SystemVerilog
- Verilog


### Results
- 100% Functional Coverage
- Protocol Compliance Verified
