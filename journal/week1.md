# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure

The root module structure is as follows:
- PROJECT_ROOT
    - variables.tf
    - main.tf
    - providers.tf
    - outputs.tf
    - terraform.tfvars
    - Readme


[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

### Terraform Cloud Variables
In terraform cloud, we have two types of variables:
- Terraform Variables - variables to be set in .tfvars file e.g user_uuid
- Environment Variables - variables to be set in bash terminal e.g Cloud service provider secrets (GCP SECRETS)

We can set variables to be sensitive in cloud, and they are stored in vault

### Loading Terraform Variables
- var flags:
To load the terraform variables, we can use the `-var` to set an input variable or overide a variable in the .tfvars file e.g `terraform plan -var user_uuid="my-user-uuid"`
- vars-file
- terraform.tfvars file
- auto.tfvars
- order of terraform variables