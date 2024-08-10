# 8-point-FFT-Accelerator-
This repository contains the design and implementation of an 8-point Fast Fourier Transform (FFT) hardware accelerator. The FFT is a fundamental algorithm in signal processing, and this project focuses on optimizing its performance through hardware acceleration. 

## Overview
This project implements an 8-point FFT using a custom hardware architecture. The design is synthesized for FPGA/ASIC platforms, aiming to provide a high-performance for FFT computation in embedded systems. The hardware accelerator is designed to be easily integrated into larger systems, such as digital signal processing pipelines.

## Features
- **8-Point FFT**: Supports computation of an 8-point FFT, which is suitable for applications requiring small-scale Fourier analysis.
- **Fixed-Point Arithmetic**: Utilizes fixed-point arithmetic for efficient computation and reduced resource usage.
- **Pipelined Architecture**: Implements a fully pipelined architecture to achieve high throughput and low latency.
- **Parameterizable Design**:Allows customization of word length and internal data widths.
- **FPGA/ASIC Compatibility**: Synthesizable for both FPGA and ASIC platforms, with resource and timing reports provided.



## Getting Started

### Prerequisites

- **Hardware Description Language (HDL) Tools**: VHDL/Verilog simulation and synthesis tools like ModelSim, Vivado, or Quartus.
- **FPGA/ASIC Development Board**: Optional, for deploying the synthesized design.
- **Python 3.x**: For running the report generation script (optional).

### Installation

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/yourusername/8-point-fft-hw-accelerator.git
   cd 8-point-fft-hw-accelerator


## Compiling Design and Running Simualtions 


