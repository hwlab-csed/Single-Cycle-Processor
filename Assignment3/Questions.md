# Sample Questions

## **Q1. Find the dataadr and writedata for the given machine code.**

|Question A  |Question B |Question C |
|----------------|----------------------|----------------|
|20020020   |20020020 |20020005 |
|2003002d  |20030030|2003000c|
|20040007  |20050000|2067fff7|
|20050000  |10a00002|00e22025|
|20050001  |00432820|00642824|
|10850004  |00432820|00a42820|
|20050001  |ac050025|ac050054|
|20620004  |
|00641020  |
|ac02000a  |

We can find the dataadr and writedata using the testbench.


## **Q2. Implement a single-cycle MIPS processor for the specifications given below using Verilog.**

The Little-Endian Computer Architecture serves as the foundation for the development of the 16-bit NITC-RISC18 computer for teaching. It (NITC-RISC18) is an 8-register, 16-bit computer system. It uses registers R0 to R7 for general purposes. However, Register R7 always stores the program counter. This architecture also uses a condition code register, which has two flags: the Carry flag (C) and the Zero flag (Z).

The NITC-RISC18 is very simple, but it is general enough to solve complex problems with three machine-code instruction formats (R, I, and J type) and a total of six instructions shown below.

### **R Type Instruction format**
| Opcode | Register A (RA) | Register B (RB) | Register B (RB) | Unused | Condition (CZ) |
|--------|-----------------|-----------------|-----------------|--------|-----------------|
| 4 bit  | 3 bit           | 3 bit           | 3 bit           | 1 bit  | 2 bit           |

### **I Type Instruction format**
| Opcode | Register A (RA) | Register C (RC) | Immediate      |
|--------|-----------------|-----------------|----------------|
| 4 bit  | 3 bit           | 3 bit           | 6 bits signed  |

### **J Type Instruction format**
| Opcode | Register A (RA) | Immediate      |
|--------|-----------------|----------------|
| 4 bit  | 3 bit           | 9 bits signed  |

### **Instructions Encoding**
![Instructions_Encoding](https://github.com/Vaishnavi-Pai19/Single-Cycle-Processor/assets/133690178/56dc1b22-a73e-486c-9c18-a041f7f29be9)



RA: Register A, 
RB: Register B, 
RC: Register C
