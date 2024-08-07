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
  - as you see in pic sum and carry shows pervoius processed data.


## synthesis
- step1:
  ```
  1. source -echo -verbose ./rm_setup/dc_setup.tcl
  2. set RTL_SOURCE_FILES ./../rtl/miniproject/my_alu.v
  3. define_design_lib WORK -path ./WORK
  ```
  - [Sourcing the Setup Script](referencen/1.png)
  - [Setting RTL Source Files & Defining the Design Library](referencen/2.png)
- step2:
  ```
  4. analyze -format verilog ${RTL_SOURCE_FILES}
  5. echo ${DESIGN_NAME}
  6. elaborate ${DESIGN_NAME}

  ```
  - NOTE:```common_setup.tcl change DESGIN_NAME is not set to current desgin ```
  - [command 4 is used to parse the Verilog RTL source files and prepare them for elaboration. It checks the syntax and creates intermediate representations of the design](referencen/2.png)
  - [command 6  is used to create a complete, detailed representation of the design from the analyzed RTL files. It resolves module instances, connects ports, and checks for any inconsistencies in the design hierarchy. After elaboration, the design is ready for optimization and synthesis.](referencen/4.png)

- step3:
  ```
  compile
  compile_ultra


  ```
  - [complie the code](referencen/6.png)
  - <img width="814" alt="10" src="https://github.com/user-attachments/assets/9ca2d56d-051a-4301-9803-b78d59bf2dbc">

-step 4: ```  report_timing```
  - met slack with clock period 10 now.
  - <img width="764" alt="11" src="https://github.com/user-attachments/assets/a065de6a-ac29-4003-bfb1-26fe0e8d139d">


-step4:```write -format verilog -hierarchy -output${RESULTS_DIR}${DCRM_FINAL_VERILOG_OUTPUT_FILE}```
## floorplan







