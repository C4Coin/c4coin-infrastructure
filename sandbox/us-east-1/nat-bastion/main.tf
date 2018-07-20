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







