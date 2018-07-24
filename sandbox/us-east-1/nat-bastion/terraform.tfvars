region = "us-east1"

#NAT
zone = "us-east1-b"
subnet_name = "subnet-us-east1"
//tags = ["gw"]

#Bastion
bastion_name="bastion"
bastion_zones = ["us-east1-b"]
bastion_image = "debian-cloud/debian-8"
bastion_instance_type = "n1-standard-1"
bastion_user = "bastion-user"
bastion_ssh_key = "bastion-ssh-key"

