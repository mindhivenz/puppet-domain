# Changelog

## Release 1.1.0

### Bug fixes

- `domain::customer` and `domain::site` return undef for a certname with no domain, instead of failing the catalog with "Left match operand must result in a String value"

### Other changes

- Require Puppet `>= 7.0.0 < 9.0.0` and support Ubuntu 20.04, 22.04 and 24.04
- Converted from PDK to jig, with VoxBox CI and full spec coverage
