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

See [AGENTS.md](AGENTS.md) for checking changes, the VoxBox gotchas and building. It is shared by every module and synced from [mindhivenz/msync](https://github.com/mindhivenz/msync).
