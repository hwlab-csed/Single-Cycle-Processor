# Single Cycle Processor

### This repository contains one code for the Single Cycle Processor, subsequent testbenches to test each instruction individually and a few questions on the topic.


## Single Cycle Code: 
[Main Code](Sample%20Codes/SingleCycle.v)

## Testbenches for Instructions: 
The best way to check if the single cycle code correctly implements an instruction is to update the instruction memory (ie. machine code) to use that particular operation before storing the result at a particular location in the data memory. Then, we use the testbench to cross-check the value stored at that address with the expected result of the instruction. If they match, the instruction has executed properly and the program will print 'Simulation succeeded'.


1. Add: [tb_add.v](Sample%20Codes/tb_add.v)
2. Subtract: [tb_sub.v](Sample%20Codes/tb_sub.v)
3. Branch if Equal: [tb_beq.v](Sample%20Codes/tb_beq.v)
4. Load Word: [tb_lw.v](Sample%20Codes/tb_lw.v)
5. Store Word: [tb_sw.v](Sample%20Codes/tb_sw.v)
- [Video Explanation](https://www.youtube.com/watch?v=_pPCv_fkO1w)

## Modification Questions:
1. Modify the given Single Cycle Processor code to include the Andi, Ori and Xori instructions.
   - [Link to Question & Solution](Modification/andi%2C%20ori%2C%20xori/README.md)

2. Modify the given Single Cycle Processor code to include the Jr (Jump Register) instruction.
   
   - [Link to Question & Solution](Modification/jr/README.md)
   - [Video Explanation](https://www.youtube.com/watch?v=YdMKU0FelT4&list=PLJGMNIXnU1SLUNfqTxjIEp-oW4wWtr5Mc&index=10)


## Sample Assignment Questions:
- [Link to Questions](Sample%20Questions/Questions.md)
