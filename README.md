# domain

Reads the customer and site from our node naming convention, `<host>.<site>.<customer>.lan`.

## Usage

In your main manifest `site.pp`:

```puppet
$customer = domain::customer()
$site = domain::site()
```

For `line1.factory.acme.lan`, `domain::customer()` returns `acme` and `domain::site()` returns `factory`. Both read `$trusted['domain']` (derived from the certname) and return `undef` for any certname that doesn't follow the convention, including one with no domain.

You can then use them in your `hiera.yaml`:

```yaml
hierarchy:
  - name: "Eyaml backend"
    lookup_key: eyaml_lookup_key
    paths:
      - "%{customer}/%{site}/%{trusted.hostname}.yaml"
      - "%{customer}/%{site}.yaml"
      - "%{customer}/common.yaml"
      - "%{facts.architecture}.yaml"
      - "common.yaml"
```

## Development

The module is managed with [jig](https://github.com/voxpupuli/jig). Validation and unit tests run inside the [VoxBox](https://github.com/voxpupuli/container-voxbox) container, so the only host requirements are jig and Docker (or Podman).

### Setup

Install jig from its [releases](https://github.com/voxpupuli/jig/releases), then point its runner at the same VoxBox image CI uses (see `VOXBOX_IMAGE` in `.github/workflows/ci.yml`):

```shell
export JIG_RUNNER_TYPE=voxbox
export JIG_RUNNER_IMAGE=ghcr.io/voxpupuli/voxbox:10.1.0-openvox8.30.0@sha256:01bb8ce5e24d5b111934660f75e2786b4d7c7adcaa7518a564856d1d3041d10d
```

To make this permanent, put the equivalent `[runner]` section in your jig config file instead (see the [jig voxbox docs](https://github.com/voxpupuli/jig/blob/main/docs/voxbox.md)).

### Validate and test

```shell
jig validate     # syntax, puppet-lint and rubocop
jig test unit    # rspec-puppet unit tests
```

Run a single spec file by calling the container directly:

```shell
docker run --rm -v "$PWD:/repo" -e SPEC=spec/functions/site_spec.rb "$JIG_RUNNER_IMAGE" spec
```

### Build

```shell
jig build
```

The package is written to `pkg/`. Which files are packaged is controlled by the `[build]` section of `jig.toml`.
