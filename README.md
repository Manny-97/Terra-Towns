# Terraform Beginner Bootcamp 2023

### Install the Terraform CLI

### changes in AWS Terraform CLI Installation
The Terraform CLI installation have changed due to gpg keyring changes. So we needed to refer to the latest installation guide.
[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Considerations for Linux Distribution

This project is built against Ubunutu.
Please consider checking your Linux Distrubtion and change accordingly to distrubtion needs. 

[How To Check OS Version in Linux](
https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)

Example of checking OS Version:

```
$ cat /etc/os-release

PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```

### Refactoring Bash Script
Refactor the installation command into a bash script and make it executable.

- Keep the Gitpod file tidy ([.gitpod.yml](.gitpod.yml))
- Enable manual debugging and execution of the Terraform CLI.

#### Shebang Considerations

A Shebang (prounced Sha-bang) tells the bash script what program that will interpet the script. eg. `#!/bin/bash`

ChatGPT recommended this format for bash: `#!/usr/bin/env bash`

- for portability for different OS distributions 
-  will search the user's PATH for the bash executable

https://en.wikipedia.org/wiki/Shebang_(Unix)

#### Execution Considerations

When executing the bash script we can use the `./` shorthand notiation to execute the bash script.

eg. `./bin/install_terraform_cli.sh`

If we are using a script in .gitpod.yml  we need to point the script to a program to interpert it.

eg. `source ./bin/install_terraform_cli.sh`

#### Linux Permissions Considerations

In order to make our bash scripts executable we need to change linux permission for the fix to be exetuable at the user mode.

```sh
chmod u+x ./bin/install_terraform_cli.sh
```

alternatively:

```sh
chmod 744 ./bin/install_terraform_cli.sh
```

https://en.wikipedia.org/wiki/Chmod

## Gitpod Lifecycle

We need to be careful when using the Init because it will not rerun if we restart an existing workspace.

https://www.gitpod.io/docs/configure/workspaces/tasks


## Environment Variables

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