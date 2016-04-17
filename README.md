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

## Licence

MIT License
