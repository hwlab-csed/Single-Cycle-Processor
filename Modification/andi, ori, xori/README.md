# Sample Modification Question 2 - ANDI, ORI, XORI
## Question
Modify the [given code](../../Sample%20Codes/SingleCycle.v) to implement andi, xori, ori in the microprocessor and run the following sample instructions to check it.

|Question no.    |ASCII                          |
|----------------|-------------------------------|
|1               |`addi $4, $0, 5`               |
|                |`andi $4, $4, 11`              |
|                |`sw  $4 20($0)`                |
|2               |`addi $4, $0, 5`               |
|                |`ori $4, $4, 11 `              |
|                |`sw  $4 20($0)`                |
|3               |`addi $4, $0, 5`               |
|                |`xori $4, $4, 11`              |
|                |`sw  $4 20($0)`                |

## Code Solution
- [SingleCycleV1.v](SingleCycleV1.v)
