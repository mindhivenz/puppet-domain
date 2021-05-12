function domain::customer() >> String {
  if $trusted[domain] =~ /^([^.]+)\.([^.]+)\.lan$/ {
    $2
  } else {
    undef
  }
}
