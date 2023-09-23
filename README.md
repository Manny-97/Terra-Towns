# Terraform Beginner Bootcamp 2023

### Working with Env Vars

We can list out all environment variable using the `env` command

We can filter specific environment variable using grep e.g `env | grep AWS_`

#### Setting and Unsetting Environment Variables

In the terminal we can set using `export HELLO='World'`

We can unset using `set HELLO`

We can set an env var temporarily when just running a command

```sh
HELLO='world' ./bim/print_message
```

Within a bash script we can set env var without writing export e.g.

```sh
#!/usr/bin/env bash

HELLO='world'

echo $HELLO
```

#### Printing Environment Variables in Gitpod

We can print environment variables using echo e.g. `echo $HELLO`

#### Scoping of Environment variables

New terminal window are not aware of already set env vars

#### Persisting Environment Variables in Gitpod

We can persist env vars in gitpod by storing them in Gitpod Secret Storage.