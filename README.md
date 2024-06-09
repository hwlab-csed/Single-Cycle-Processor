# Single Cycle Processor

### This repository contains one code for the Single Cycle Processor, subsequent testbenches to test each instruction individually and 3 types of questions on the topic.


## Single Cycle Code: 
[Main Code](Sample%20Codes/SingleCycleV1.v)

## Testbenches for Instructions: 
The best way to check if the single cycle code correctly implements an instruction is to update the instruction memory (ie. machine code) to use that particular operation before storing the result at a particular location in the data memory. Then, we use the testbench to cross-check the value stored at that address with the expected result of the instruction. If they match, the instruction has executed properly and the program will print 'Simulation succeeded'.


1. Add: [tb_add.v](Sample%20Codes/tb_add.v)
2. Subtract: [tb_sub.v](Sample%20Codes/tb_sub.v)
3. Branch if Equal: [tb_beq.v](Sample%20Codes/tb_beq.v)
4. Load Word: [tb_lw.v](Sample%20Codes/tb_lw.v)
5. Store Word: [tb_sw.v](Sample%20Codes/tb_sw.v)

## Modification Questions:
1. Modify the given Single Cycle Processor code to include the Jr (Jump Register) instruction.
   
   - [Link to Question & Solution](Modification/jr/README.md)
   - [Video Explanation](https://www.youtube.com/watch?v=YdMKU0FelT4&list=PLJGMNIXnU1SLUNfqTxjIEp-oW4wWtr5Mc&index=10)
     
2. Modify the given Single Cycle Processor code to include the ANDI, ORI and XORI instructions.
   - [Link to Question & Solution](Modification/jr/README.md)

## Sample Assignment Questions:
1. Assignment3 : [Click here to view](Assignment3/Questions.md)
