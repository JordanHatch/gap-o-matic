# Gap-o-matic

A small app to build dashboard showing the status of individual areas of a
project.

## Requirements

- Ruby 2.3.0
- PostgreSQL

## Running the app

```
bin/rake db:setup
foreman start
```

## Configuration

The application accepts the following environment variables as configuration:

- `USERNAME`: username for HTTP basic authentication
- `PASSWORD`: password for HTTP basic authentication
- `FORCE_SSL`: will force SSL connections (using `Rack::SslEnforcer`) when set
- `PERMITTED_EMAIL_HOSTNAMES`: a comma-separated whitelist of email domains permitted to sign in with Google Apps

## Licence

MIT License
