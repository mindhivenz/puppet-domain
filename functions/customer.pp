function domain::customer () >> Optional[String] {
  if $trusted[domain] =~ /^([^.]+)\.([^.]+)\.lan$/ {
    $2
  } else {
    undef
  }
}
