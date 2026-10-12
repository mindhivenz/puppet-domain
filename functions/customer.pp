# Reads the customer from the trusted domain `<site>.<customer>.lan`.
# @return [Optional[String]] The customer, or undef for a certname outside the convention
function domain::customer() >> Optional[String] {
  dig(domain::labels(), 'customer')
}
