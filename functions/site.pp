# Reads the site from the trusted domain `<site>.<customer>.lan`.
# @return [Optional[String]] The site, or undef for a certname outside the convention
function domain::site() >> Optional[String] {
  dig(domain::labels(), 'site')
}
