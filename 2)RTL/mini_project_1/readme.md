https://edaplayground.com/x/PfEG
## Specification
-alu control
  - 0	0  ->	alu is completely off
  - 0	1  ->	4-bit full adder (using one 1 bit full adder)
  - 1	0  ->	4-bit full sub (depends how you want to design)
  - 1	1  ->	No Operation
## DESGIN and verification
### RTL
- based on specification designed a 4 bit alu.
- used case statement for 4 tpes of operation.
- for add immlemented a 1-bit adder and made into 4 bit adder and instantiancted in my alu to use for alu operations.
  ![WhatsApp Image 2024-07-15 at 5 13 25 PM](https://github.com/user-attachments/assets/6a38c55e-3187-4d1b-baac-d794ab8cebe9)
  ![WhatsApp Image 2024-07-15 at 5 13 46 PM](https://github.com/user-attachments/assets/a4c29e6c-da7f-4cfe-bb3a-e18fbc9df623)

### simulation using vcs and verdi
- step 1: ```vcs -full64 -sverilog tb.v my_alu.v ```
  ![image](https://github.com/user-attachments/assets/769d933e-7466-4bc9-88d4-7042f8a99370)
- step 2: ```./simv -Verdi```
  ![image](https://github.com/user-attachments/assets/42458a30-0e95-459a-85ba-7e85a7e09f2e)
- step3:```Verdi -ssf dump.vcd -nologo ```
  <img width="677" alt="image" src="https://github.com/user-attachments/assets/52961719-a9bc-4a0f-a503-6c148ea84ae0">


## synthesis





