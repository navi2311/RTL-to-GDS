##  FP STEPs
```ICC2```
- step 1 : setting the library path
  ```set PDK_PATH ./../ref```
  - set the PDK path .
  - in ref directory we have all reference file


- step 2 :create a new design library
  - "ref-lib" will point to reference to ndm pacakge


    ```create_lib -ref_lib $PDK_PATH/lib/ndm/saed32rvt_c.ndm <name_of_the_library>```


#step 3 : read the verilog gate-level netlist


#read_verilog {./../DC/results/full_adder.mapped.v} -library <name_of_the_library> -design full_adder -top full_adder
read_verilog {./../DC/results/register.mapped.v} -library <name_of_the_library> -design register -top register

######################################
# FloorPlan Creation
####################################
#scenario 1
####################i################
        initialize_floorplan
        set_individual_pin_constraints -ports [get_ports] -sides 3
        place_pins -self
        create_placement -floorplan

        save_block
        save_lib

        close_block
        close_lib

############################
###### To open lib and block
############################

open_lib <library name>

open_block <block name>

#######################################
#scenario 2
######################################
       initialize_floorplan  -shape R -core_offset 1
        set_individual_pin_constraints -ports [get_ports A] -sides 2
        place_pins -self
        create_placement -floorplan -effort very_low


#scenario 3

       initialize_floorplan -shape L -core_offset 2 -coincident_boundary true
       set_individual_pin_constraints -ports [get_ports {A B}] -sides 6
       place_pins -self
       create_placement -floorplan  -effort medium

