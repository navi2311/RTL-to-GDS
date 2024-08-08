<img width="1547" alt="image" src="https://github.com/user-attachments/assets/b97309eb-fca9-4d19-b51d-907c2b5946ec">

why 
<img width="641" alt="image" src="https://github.com/user-attachments/assets/12b2d40d-6d08-4170-98a6-1306647715ee">

Warning:  ./../rtl/pipeline_r_i_sw_lw/register.v:36: signed to unsigned assignment occurs. (VER-318)

<img width="944" alt="image" src="https://github.com/user-attachments/assets/c500f5f8-500c-4fc7-b06f-5b4eb53b8c09">

<img width="381" alt="image" src="https://github.com/user-attachments/assets/dc3f3b73-ed99-4725-bf8d-337e843b0be9">

```
     1  source -echo -verbose ./rm_setup/dc_setup.tcl
     2  #set RTL_SOURCE_FILES ./../rtl/register/register.v
     3  #set RTL_SOURCE_FILES ./../rtl/full_adder_rtl.v
     4  #set RTL_SOURCE_FILES ./../rtl/alu_with_flop/alu_with_flop.v
     5  set RTL_SOURCE_FILES ./../rtl/pipeline_r_i_sw_lw/top.v
     6  define_design_lib WORK -path ./WORK
     7  set_app_var hdlin_enable_hier_map true
     8  analyze -format verilog ${RTL_SOURCE_FILES}
     9  elaborate ${DESIGN_NAME}
    10  current_design
    11  create_clock -period 5 [get_ports clk]
    12  set_verification_top
    13  compile
    14  check_design
    15  #start_gui
    16  
    17  
    18  report_timing
mkdir -p /ve/ti_home/ti1_31/intership_Jun-Jul_2024/DC/results/pipeline_clock_5/
    19 
    20  write -format verilog -hierarchy -output${RESULTS_DIR}${DCRM_FINAL_VERILOG_OUTPUT_FILE}
    21  #write -format verilog -hierarchy -output${RESULTS_DIR}${DCRM_FINAL_VERILOG_OUTPUT_FILE}
    22  #write -format verilog -hierarchy -output ./results/pipeline_clock_5/top_mapped.v
    23  #write -format verilog -hierarchy -output./results/pipeline_clock_5/top_mapped.v
    24     30  history > pipeline_run.tcl




```
<img width="665" alt="image" src="https://github.com/user-attachments/assets/3020f2a9-fdf8-4e70-a0a6-c85337bc4ed0">
for clock period 5
