set_part xczu19eg-ffvd1760-2-i
puts "PART=[current_part]"
set hits [get_package_pins -quiet -filter {NAME == AV27}]
puts "AV27_count=[llength $hits]"
set sites [get_sites -quiet -filter {NAME =~ *IO_L9P_T1L_N4_AD12P_65*}]
puts "site_count=[llength $sites]"
foreach s $sites {puts "site=$s"}
if {[llength $sites] > 0} {
  set pp [get_package_pins -quiet -of_objects $sites]
  puts "pkgpins=$pp"
}
exit
