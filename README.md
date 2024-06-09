# Single Cycle Processor

### This repository contains one code for the Single Cycle Processor, subsequent testbenches to test each instruction individually and 3 types of questions on the topic.


## Single Cycle Code: 
[Main Code](Sample%20Codes/SingleCycleV1.v)

## Testbenches for Instructions: 
The best way to check if the single cycle code correctly implements an instruction is to update the instruction memory (ie. machine code) to use that particular operation before storing the result at a particular location in the data memory. Then, by using the testbench to cross-check the value stored at that address with the correct result of the instruction, we can determine if the instruction has executed properly. If it has, the program will print 'Simulation succeeded'.


1. Add: [tb_add.v](Sample%20Codes/tb_add.v)
2. Subtract: [tb_sub.v](Sample%20Codes/tb_sub.v)
3. Branch if Equal: [tb_beq.v](Sample%20Codes/tb_beq.v)
4. Load Word: [tb_lw.v](Sample%20Codes/tb_lw.v)
5. Store Word: [tb_sw.v](Sample%20Codes/tb_sw.v)

## Modification Question:
1. Modify the given Single Cycle Processor code to include the Jr(Jump Register) instruction.
    [Link to Question](Modification/jr/README.md)
    [Solution Code](Modification/jr/README.md)
    [Video Explanation](Modification/jr/README.md)

## Sample Assignment Qn:
1. Assignment3 : [Click here to view](Assignment3/Questions.md)
