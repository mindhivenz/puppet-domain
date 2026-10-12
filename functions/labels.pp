# Splits the trusted domain `<site>.<customer>.lan` into its labels.
# @api private
# @return [Optional[Struct[{ site => String, customer => String }]]] The labels, or undef for a certname outside the convention
function domain::labels() >> Optional[Struct[{ site => String, customer => String }]] {
  $trusted['domain'] ? {
    /^([^.]+)\.([^.]+)\.lan$/ => { site => $1, customer => $2 },
    default                   => undef,
  }
}
