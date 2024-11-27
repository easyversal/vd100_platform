create_project project_1 ./project_1 -part xcve2302-sfva784-1LP-e-S
create_bd_design "ext_platform_part" -mode batch
instantiate_example_design -template xilinx.com:design:ext_platform_part:1.0 -design ext_platform_part -options { Clock_Options.VALUE {clk_out1 250.000 0 true} Include_AIE.VALUE true Include_DDR.VALUE true}

update_compile_order -fileset sources_1
set_property name DDR4 [get_bd_intf_ports CH0_DDR4_0_0]
set_property name sys_clk [get_bd_intf_ports sys_clk0_0]
set_property CONFIG.FREQ_HZ 200000000 [get_bd_intf_ports /sys_clk]
startgroup
set_property -dict [list \
  CONFIG.MC_CHAN_REGION1 {NONE} \
  CONFIG.MC_COMPONENT_WIDTH {x16} \
  CONFIG.MC_INPUTCLK0_PERIOD {5000} \
] [get_bd_cells noc_ddr4]
set_property -dict [list CONFIG.CONNECTIONS {MC_0 {read_bw {128} write_bw {128} read_avg_burst {4} write_avg_burst {4}}}] [get_bd_intf_pins /noc_ddr4/S00_INI]
endgroup
startgroup
set_property -dict [list \
  CONFIG.BOOT_MODE {Custom} \
  CONFIG.IO_CONFIG_MODE {Custom} \
  CONFIG.PS_PMC_CONFIG { \
    BOOT_MODE {Custom} \
    CLOCK_MODE {Custom} \
    DDR_MEMORY_MODE {Custom} \
    IO_CONFIG_MODE {Custom} \
    PMC_CRP_PL0_REF_CTRL_FREQMHZ {99.999992} \
    PMC_QSPI_FBCLK {{ENABLE 1} {IO {PMC_MIO 6}}} \
    PMC_QSPI_PERIPHERAL_ENABLE {1} \
    PMC_QSPI_PERIPHERAL_MODE {Dual Parallel} \
    PMC_SD0 {{CD_ENABLE 0} {CD_IO {PMC_MIO 24}} {POW_ENABLE 0} {POW_IO {PMC_MIO 17}} {RESET_ENABLE 1} {RESET_IO {PMC_MIO 49}} {WP_ENABLE 0} {WP_IO {PMC_MIO 25}}} \
    PMC_SD0_DATA_TRANSFER_MODE {8Bit} \
    PMC_SD0_PERIPHERAL {{CLK_100_SDR_OTAP_DLY 0x00} {CLK_200_SDR_OTAP_DLY 0x2} {CLK_50_DDR_ITAP_DLY 0x1E} {CLK_50_DDR_OTAP_DLY 0x5} {CLK_50_SDR_ITAP_DLY 0x2C} {CLK_50_SDR_OTAP_DLY 0x5} {ENABLE 1} {IO {PMC_MIO 37 .. 49}}} \
    PMC_SD0_SLOT_TYPE {eMMC} \
    PMC_SD1 {{CD_ENABLE 1} {CD_IO {PMC_MIO 28}} {POW_ENABLE 0} {POW_IO {PMC_MIO 12}} {RESET_ENABLE 0} {RESET_IO {PMC_MIO 12}} {WP_ENABLE 0} {WP_IO {PMC_MIO 1}}} \
    PMC_SD1_PERIPHERAL {{CLK_100_SDR_OTAP_DLY 0x00} {CLK_200_SDR_OTAP_DLY 0x00} {CLK_50_DDR_ITAP_DLY 0x00} {CLK_50_DDR_OTAP_DLY 0x00} {CLK_50_SDR_ITAP_DLY 0x2C} {CLK_50_SDR_OTAP_DLY 0x4} {ENABLE 1} {IO {PMC_MIO 26 .. 36}}} \
    PMC_SMAP_PERIPHERAL {{ENABLE 0} {IO {32 Bit}}} \
    PMC_USE_PMC_NOC_AXI0 {1} \
    PS_ENET0_MDIO {{ENABLE 1} {IO {PMC_MIO 50 .. 51}}} \
    PS_ENET0_PERIPHERAL {{ENABLE 1} {IO {PS_MIO 0 .. 11}}} \
    PS_GEN_IPI0_ENABLE {1} \
    PS_GEN_IPI0_MASTER {A72} \
    PS_GEN_IPI1_ENABLE {1} \
    PS_GEN_IPI1_MASTER {A72} \
    PS_GEN_IPI2_ENABLE {1} \
    PS_GEN_IPI2_MASTER {A72} \
    PS_GEN_IPI3_ENABLE {1} \
    PS_GEN_IPI3_MASTER {A72} \
    PS_GEN_IPI4_ENABLE {1} \
    PS_GEN_IPI4_MASTER {A72} \
    PS_GEN_IPI5_ENABLE {1} \
    PS_GEN_IPI5_MASTER {A72} \
    PS_GEN_IPI6_ENABLE {1} \
    PS_GEN_IPI6_MASTER {A72} \
    PS_IRQ_USAGE {{CH0 1} {CH1 0} {CH10 0} {CH11 0} {CH12 0} {CH13 0} {CH14 0} {CH15 0} {CH2 0} {CH3 0} {CH4 0} {CH5 0} {CH6 0} {CH7 0} {CH8 0} {CH9 0}} \
    PS_NUM_FABRIC_RESETS {1} \
    PS_PL_CONNECTIVITY_MODE {Custom} \
    PS_UART0_PERIPHERAL {{ENABLE 1} {IO {PS_MIO 16 .. 17}}} \
    PS_USE_FPD_AXI_NOC0 {1} \
    PS_USE_FPD_AXI_NOC1 {1} \
    PS_USE_FPD_CCI_NOC {1} \
    PS_USE_M_AXI_FPD {1} \
    PS_USE_NOC_LPD_AXI0 {1} \
    PS_USE_PMCPL_CLK0 {1} \
    PS_USE_PMCPL_CLK1 {0} \
    PS_USE_PMCPL_CLK2 {0} \
    PS_USE_PMCPL_CLK3 {0} \
    SMON_ALARMS {Set_Alarms_On} \
    SMON_ENABLE_TEMP_AVERAGING {0} \
    SMON_TEMP_AVERAGING_SAMPLES {0} \
  } \
] [get_bd_cells CIPS_0]
endgroup
validate_bd_design

save_bd_design
export_ip_user_files -of_objects  [get_files ./project_1/project_1.srcs/sources_1/imports/hdl/ext_platform_part_wrapper.v] -no_script -reset -force -quiet
remove_files ./project_1/project_1.srcs/sources_1/imports/hdl/ext_platform_part_wrapper.v
file delete -force ./project_1/project_1.srcs/sources_1/imports/hdl/ext_platform_part_wrapper.v
make_wrapper -files [get_files ./project_1/project_1.srcs/sources_1/bd/ext_platform_part/ext_platform_part.bd] -top
set_property synth_checkpoint_mode None [get_files ./project_1/project_1.srcs/sources_1/bd/ext_platform_part/ext_platform_part.bd]
generate_target all [get_files ./project_1/project_1.srcs/sources_1/bd/ext_platform_part/ext_platform_part.bd]

add_files -norecurse ./project_1/project_1.gen/sources_1/bd/ext_platform_part/hdl/ext_platform_part_wrapper.v
update_compile_order -fileset sources_1
add_files -fileset constrs_1 -norecurse constraints.xdc

set_property platform.vendor {Alinx} [current_project]
set_property platform.board_id {VD100} [current_project]
set_property platform.name {EasyVersal} [current_project]
set_property platform.version {1.0} [current_project]
set_property pfm_name {Alinx:VD100:EasyVersal:1.0} [get_files -all {./project_1/project_1.srcs/sources_1/bd/ext_platform_part/ext_platform_part.bd}]
set_property platform.uses_pr {false} [current_project]
write_hw_platform -force -file ./project_1/easyversal_vd100.xsa
