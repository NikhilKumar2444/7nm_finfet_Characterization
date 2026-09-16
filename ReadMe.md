# FinFET Standard Cell Characterization

An open-source standard-cell characterization project based on a 7nm FinFET technology model. The project uses the BSIM-CMG compact model with ngspice to characterize FinFET devices and CMOS standard cells across different transistor fin counts.

## Objectives

- Understand and characterize BSIM-CMG FinFET devices.
- Study the effect of NFIN on transistor drive strength.
- Build basic CMOS standard cells using FinFET devices.
- Extract DC, timing, and power characteristics.
- Automate simulation and data analysis using Python.
- Build the foundation for generating Liberty (`.lib`) timing models.

## Tools

- **ngspice** – circuit simulation
- **BSIM-CMG** – FinFET compact model
- **OpenVAF** – Verilog-A to OSDI model compilation
- **Python** – simulation data processing and visualization
- **NumPy / Pandas / Matplotlib** – analysis and plotting
- **ChatGPT / Claude** – documentation and project development assistance

## Characterization Flow

```text
BSIM-CMG Verilog-A
        ↓
     OpenVAF
        ↓
      OSDI
        ↓
     ngspice
        ↓
   FinFET Devices
        ↓
   Standard Cells
        ↓
 DC / Timing / Power
        ↓
 Python Data Analysis
        ↓
   Plots / Results