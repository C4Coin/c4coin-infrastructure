
variable "project" {}
variable "region" {}
variable "zone" {}

#NAT
variable "vpc_name" {}
variable "subnet_name" {}
//variable "tags" {type = "list"}

#Bastion
variable "bastion_name" {}
//variable "project" {}
variable "bastion_zones" { type = "list" }
//variable "subnet_name" {}
variable "bastion_image" {}
variable "bastion_instance_type" {}
variable "bastion_user" {}
variable "bastion_ssh_key" {}
