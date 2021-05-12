# domain

Accessing information from our domain name convention.

## Description

Parses `trusted[certname]` fact for site information. 

## Example

In your main manifest `site.pp`:
```puppet
$customer = domain::customer()
$site = domain::site()
```

You can then use the current customer in your `heira.yaml`:
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
