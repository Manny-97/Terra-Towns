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

## AWS CLI Installation

AWS CLI is installed for the project via the bash script [./bin/install_aws_cli](./bin/install_aws_cli)

[Getting Started Install (AWS CLI) AWS CLI Env Vars](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
We can check if our AWS credentials is configured correctly by running the following AWS CLI command:
```sh
aws sts get-caller-identity
```
If it is successfull, it should return a json payload that looks like this:
```json
{
    "UserId": "ABCDEFGHIJKLMNO131UA5",
    "Account": "123456789124",
    "Arn": "arn:aws:iam::123456789124:user/terraform-bootcamp-beginner"
}
```
We'll need to generate AWS CLI credits from IAM User in order to the user AWS CLI.

## Terraform Basics

### Terraform registry
Terraform sources their provider and modules from the terraform registry which is located at [registry.terraform.io](https://registry.terraform.io/)
- **Providers** is an interface to APIs that will allow you to create resources in terraform 
- **Modules** are a way to refactor or make a large amount of terraform code modular, portable and shareble.
[Random Terraform Provider](https://registry.terraform.io/providers/hashicorp/random)

### Terraform console
We can see all the list of all the Terraform command by simply typing `terraform`
#### Terraform Init
This initializes the resource backend. At the start of a project we use `terraform init` to download the binaries for the terraform providers that we will use for the project
#### Terraform Plan
`terraform plan`
This will generate out a changeset about the state of our infrastructure and what will be changed. 
We can output this changeset i.e. "plan" to be passed as an apply, but often you can just ignore outputting.
#### Terraform Apply
`terraform appky`
This will run a plan and pass the changeset to be executed by terraform. Apply should prompt us "yes or no". If we want to accept yes without this procedure we can do so by using this command `terraform apply --auto-approve`
#### Terraform Destroy
`terraform destroy`
This will destroy resources.
To skip the prompt step, you can use this `terraform destroy --auto-approve`

#### Terraform Lock Files
`.terraform.lock.hcl` contains the locked versioning for the modules that should be used for this project. This file should be committed to your version control system.
#### Terraform State Files
`terraform.tfstate` contains information about the current state of your infrastructure.
This file should not be committed to your version control system, it contains sensitive data. If you loose the file, you loose the state of your infrastructure.
`terraform.tfstate.backup` is the previous state of the file
#### Terraform Directory
`.terraform` directory contains binaries of terraform providers