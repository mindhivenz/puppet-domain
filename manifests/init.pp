# @summary Parse customer and site from our standard domain name format
#
# @example
#   include domain
#   info("${domain::customer} at ${domain::site}")
class domain (
  $customer = if $trusted[domain] =~ /^([^.]+)\.([^.]+)\.lan$/ { $2 },
  $site     = if $trusted[domain] =~ /^([^.]+)\.([^.]+)\.lan$/ { $1 },
) {}
