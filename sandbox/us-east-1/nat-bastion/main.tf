provider "google" {
  project     = "${var.project}"
  region = "${var.region}"
}


terraform {
  backend "gcs" {
    bucket = "terraform-state-sandbox-c4coin"
    prefix = "/us-east-1/nat-bastion"
  }
}

module "nat-gateway" {
  source     = "../../../modules/nat"
  region     = "${var.region}"
  zone       = "${var.zone}"
  network    = "${var.vpc_name}"
  subnetwork = "${var.subnet_name}"
  //tags        = "${var.tags}"
}

module "bastion" {
  source        = "../../../modules/bastion"
  name          = "${var.bastion_name}"
  project       = "${var.project}"
  zones         = "${var.bastion_zones}"
  subnet_name   = "${var.subnet_name}"
  image         = "${var.bastion_image}"
  instance_type = "${var.bastion_instance_type}"
  user          = "${var.bastion_user}"
  ssh_key       = "${var.bastion_ssh_key}"
}







