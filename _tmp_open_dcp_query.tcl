open_checkpoint Z19_NFC_4Channel.runs/synth_1/NFC_4Channel_bd_wrapper.dcp
puts "PART=[get_property PART [current_design]]"
set p [get_package_pins -quiet AV27]
puts "AV27_count=[llength $p]"
set pins [get_package_pins]
puts "total_pins=[llength $pins]"
set fp [open "_all_pkgpins_with_bank.txt" w]
foreach x $pins {
  set b [get_property BANK $x]
  puts $fp "$x,$b"
}
close $fp
set c64 0
set c65 0
foreach x $pins {
  set b [get_property BANK $x]
  if {$b == 64} {incr c64}
  if {$b == 65} {incr c65}
}
puts "BANK64_count=$c64 BANK65_count=$c65"
exit
