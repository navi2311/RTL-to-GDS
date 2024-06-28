# UVM Hierarchy

- [Top Module](#top-module)
  - [run_test](#run-test-in-top-module)
- [Test Class](#test-class)
  - [run_test](#run-test-in-test-class)

## Top Module

### run_test in Top Module
`run_test` in the Top Module starts the entire UVM testbench execution. This is the entry point where the simulation begins, and all UVM phases start from this method.

## Test Class

### run_test in Test Class
- It is a component class.
- Created by `uvm_root` (often referred to as the boogeman) in the Top Module when `run_test` is called.
- [Navigate to run_test in Top Module](#run-test-in-top-module)

When you click on the [run_test in Test Class](#run-test-in-test-class), it should direct you to the `run_test` section in the Top Module for a full understanding of what that `run_test` does and how it integrates with the overall UVM testbench execution.
