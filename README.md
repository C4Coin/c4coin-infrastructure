# C4 Coin Infrastructure

## How to use this project

1. Install Terraform

```bash
brew install terraform
```

2. To deploy the infrastructure changes,
Navigate to any of the environment (PROD, DEV or SANDBOX) and region.


```bash
cd dev && cd global
``` 

```bash
terraform init
```

```bash
terraform plan -var-file="../../terraform.auto.tfvars"
```

```bash
terraform apply -var-file="../../terraform.auto.tfvars"
```

