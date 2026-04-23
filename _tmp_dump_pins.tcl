set_part xczu19eg-ffvd1760-2-i
puts "PART=[get_property PART [current_project]]"
set pinAV27 [get_package_pins -quiet AV27]
puts "AV27_count=[llength $pinAV27]"
set b64 [get_iobanks -quiet 64]
set b65 [get_iobanks -quiet 65]
puts "bank64=[llength $b64] bank65=[llength $b65]"
set s64 [get_sites -quiet -of_objects $b64]
set s65 [get_sites -quiet -of_objects $b65]
set p64 [lsort [get_package_pins -quiet -of_objects $s64]]
set p65 [lsort [get_package_pins -quiet -of_objects $s65]]
puts "p64_count=[llength $p64]"
puts "p65_count=[llength $p65]"
set fp [open "_bank64_65_pkgpins.txt" w]
puts $fp "BANK64"
foreach p $p64 {puts $fp $p}
puts $fp "BANK65"
foreach p $p65 {puts $fp $p}
close $fp
exit
