# C4 Coin Infrastructure

## How to use this project

1. Install Terraform 

Mac
```bash
brew install terraform
```
Linux
```bash
sudo apt-get install unzip

wget https://releases.hashicorp.com/terraform/0.11.1/terraform_0.11.1_linux_amd64.zip

unzip terraform_0.11.1_linux_amd64.zip

sudo mv terraform /usr/local/bin/

terraform --version
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

3. cd init/(sandbox/dev/qa/prod)

a. follow setup-terraform-service-account.txt to create terraform service account

b. create bucket for terraform state files
```bash
terraform init 
```
```bash
terraform plan -var-file="../../terraform.auto.tfvars"
```
```bash
terraform apply -var-file="../../terraform.auto.tfvars"
```

4.  Create VPC and Subnets

cd (sandbox/dev/qa/prod)/(us-east1/us-central-1)/network
```bash
terraform init
```
```bash
terraform plan -var-file="../../terraform.auto.tfvars"
```
```bash
terraform apply -var-file="../../terraform.auto.tfvars"