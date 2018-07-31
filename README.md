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
2. Modify  (sandbox/dev/qa/prod)/terraform.auto.tfvars for your project and vpc name

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

4.  Create VPC and Subnet

cd (sandbox/dev/qa/prod)/(us-east1/us-central-1)/network
```bash
terraform init
```
```bash
terraform plan -var-file="../../terraform.auto.tfvars"
```
```bash
terraform apply -var-file="../../terraform.auto.tfvars"
```

5.  Create firewalls

cd (sandbox/dev/qa/prod)/(us-east1/us-central-1)/firewall
```bash
terraform init
```
```bash
terraform plan -var-file="../../terraform.auto.tfvars"
```
```bash
terraform apply -var-file="../../terraform.auto.tfvars"
```

6.  Create NAT + Bastion

cd (sandbox/dev/qa/prod)/(us-east1/us-central-1)/nat-bastion
```bash
terraform init
```
```bash
terraform plan -var-file="../../terraform.auto.tfvars"
```
```bash
terraform apply -var-file="../../terraform.auto.tfvars"
```
