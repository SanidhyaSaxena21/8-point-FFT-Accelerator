# 8-point-FFT-Accelerator
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
   git clone https://github.com/SanidhyaSaxena21/8-point-FFT-Accelerator.git
   cd 8-point-fft-hw-accelerator
   
1. **Compile the Design:**
   ```bash
   iverilog -c filelist
   
### Architecture Overview

The architecture of an 8-point FFT hardware accelerator is designed to efficiently perform the Fast Fourier Transform on a sequence of 8 complex input samples. The architecture typically includes several key components that work together to achieve high-speed, low-latency, and power-efficient FFT computation.
![8-Point FFT Architecture](https://github.com/SanidhyaSaxena21/8-point-FFT-Accelerator/blob/main/docs/8%20point%20top%20level.jpeg)

### Micro Architecture 
![8 point FFT MicroArchitecture](https://github.com/SanidhyaSaxena21/8-point-FFT-Accelerator/blob/main/docs/FFT_BD.png)
This is the high-level micro architecture of the FFT block. It consists of FFT stages which is where all the combinational logic related to computation is there. We have a control block for generating READY signal when we are done with the computation. Active High reset strategy is used for out design. The designed in throughout pipelined for a higher throughput and for high operating clock frequencies. 

## Sub block
- **Stage1.v**: Has 4 instances of BF1.v, since only addition and subtraction of input is required in this stage in bit reversal form. 
- **Stage2.v**: Has 2 instances of BF1.v, and 2 instances of BF2.v. 
- **Stage3.v**: Has 3 instances of BF1.v and 1 instance of BF2.v 
- **BF1.v**: This is a basic structure of the butterfly block used in side the FFT_stage block. This is just a simple addition and subtraction block operated on 2 complex number. 
- **BF2.v**: This block works same as the BF1 block, with an additional functionality of j multiplication.
- **Complex_mul.v**: This is the complex multiplication block for multiplying the complex number.
- **Complex_mul1.v**: This is the complex multiplication block for multiplying the complex number





