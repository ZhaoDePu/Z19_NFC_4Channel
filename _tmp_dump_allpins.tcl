set_part xczu19eg-ffvd1760-2-i
set pins [get_package_pins]
puts "total_pins=[llength $pins]"
set fp [open "_all_pkgpins_with_bank.txt" w]
foreach p $pins {
  set b [get_property BANK $p]
  puts $fp "$p,$b"
}
close $fp
# quick filter counts
set c64 0
set c65 0
foreach p $pins {
  set b [get_property BANK $p]
  if {$b == 64} {incr c64}
  if {$b == 65} {incr c65}
}
puts "BANK64_count=$c64 BANK65_count=$c65"
exit
