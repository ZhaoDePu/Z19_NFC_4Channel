connect -url tcp:127.0.0.1:3121
source D:/Xilinx_2019_2/Vitis/2019.2/scripts/vitis/util/zynqmp_utils.tcl
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent JTAG-HS1 210512180081" && level==0} -index 0
fpga -file D:/Xilinx_2019_2/RTL_prj/OCOWFC_Z19/OCOWFC_Z19/Z19_NFC_4Chanel/Z19_NFC_4Channel/vitis/NFC_4CH_TEST/_ide/bitstream/NFC_4Channel_bd_wrapper_v3.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw D:/Xilinx_2019_2/RTL_prj/OCOWFC_Z19/OCOWFC_Z19/Z19_NFC_4Chanel/Z19_NFC_4Channel/vitis/z19_nfc_4ch_platform/export/z19_nfc_4ch_platform/hw/NFC_4Channel_bd_wrapper_v3.xsa -mem-ranges [list {0x80000000 0xbfffffff} {0x400000000 0x5ffffffff} {0x1000000000 0x7fffffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
set mode [expr [mrd -value 0xFF5E0200] & 0xf]
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow D:/Xilinx_2019_2/RTL_prj/OCOWFC_Z19/OCOWFC_Z19/Z19_NFC_4Chanel/Z19_NFC_4Channel/vitis/z19_nfc_4ch_platform/export/z19_nfc_4ch_platform/sw/z19_nfc_4ch_platform/boot/fsbl.elf
set bp_9_8_fsbl_bp [bpadd -addr &XFsbl_Exit]
con -block -timeout 60
bpremove $bp_9_8_fsbl_bp
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow D:/Xilinx_2019_2/RTL_prj/OCOWFC_Z19/OCOWFC_Z19/Z19_NFC_4Chanel/Z19_NFC_4Channel/vitis/NFC_4CH_TEST/Debug/NFC_4CH_TEST.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A53*#0"}
con
