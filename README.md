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

- `FORCE_SSL`: will force SSL connections (using `Rack::SslEnforcer`) when set
- `GOOGLE_CLIENT_ID`: client ID for the Google developer console account
- `GOOGLE_CLIENT_SECRET`: client secret for the Google developer console account
- `PERMITTED_EMAIL_HOSTNAMES`: a comma-separated whitelist of email domains permitted to sign in with Google Apps

## Licence

MIT License
