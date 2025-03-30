# **DSD 2025 🚀**

## **Lab 7: Sequential Circuit Design – Clock Manipulation**

Welcome to **Lab 7** of Digital System Design (DSD). This experiment focuses on designing a **sequential circuit** that efficiently manipulates the clock to display multiple characters on a **Seven Segment Display** using **flip-flops**.

---

## 📂 **Directory Structure**


---

## 🔥 **Project Description**
This lab focuses on designing a **Seven Segment Display Controller** with clock manipulation. The key objectives include:

- Storing **8 different characters** (0 to F) in memory.
- Displaying these characters on **eight seven-segment displays**.
- Implementing **clock division** to achieve a refresh rate of **100 Hz**.
- Using **flip-flops** instead of latches to implement sequential logic.

The design uses **multiplexers, encoders, decoders, and flip-flops** to efficiently control the display.

---

## 📜 **Files and Description**

### 1️⃣ **RTL Folder (rtl/)**
- [Verilog Code](https://github.com/Shah-Eman/DSD_2023_EE_178/blob/main/Lab_7/rtl/lab7.sv)

### 2️⃣ **Testbench Folder (testbench/)**
- [Testbench](https://github.com/Shah-Eman/DSD_2023_EE_178/blob/main/Lab_7/testbench/lab_7_segment_tb.sv)

### 3️⃣ **Constraints Folder (constraints/)**
- [Constraint File](https://github.com/Shah-Eman/DSD_2023_EE_178/blob/main/Lab_7/constraints/constraints.xdc)

### 4️⃣ **Docs Folder (docs/)**
- [Schematic Diagram](https://github.com/Shah-Eman/DSD_2023_EE_178/blob/main/Lab_7/Docs/Lab7.drawio)

---

## 🛠️ **Tools & Requirements**
- **FPGA Board:** Nexys A7-100T
- **Software:** Xilinx Vivado
- **Language:** System Verilog
- **Simulation:** QuestaSim

---

## 📌 **Deliverables**
1. **Report Submission**
   - Circuit design with hand-sketched partitions (MUX, Encoders, Decoders, Flip-Flops).
   - Behavioral modeling for studied components.
   - K-map derivations for unstudied components.
   - **Synthesis Maximum Combinational Delay:** Analyze the synthesis report.
   - **Implementation Maximum Combinational Delay:** Compare with synthesis report.
   - **Resource Utilization Report:** Identify FPGA resource consumption.

2. **Simulation**  
   - Simulate the module in **QuestaSim** and verify functionality.

3. **FPGA Implementation**  
   - Synthesize the circuit for **Nexys A7 FPGA**.
   - Connect inputs to **switches** and outputs to **seven-segment displays**.

---

## 🚨 **Important Notes**
- **No latches are allowed**—use flip-flops for sequential logic.
- Clock frequency must be **100 Hz** (down from 100 MHz).
- Ensure thorough **understanding** of the code—blind copying is prohibited.

---

## 👨‍💻 **Author**
- **Shah Eman** - UET, Lahore  
- **2023-EE-178**
