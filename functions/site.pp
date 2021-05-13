function domain::site () >> Optional[String] {
  if $trusted[domain] =~ /^([^.]+)\.([^.]+)\.lan$/ {
    $1
  } else {
    undef
  }
}
