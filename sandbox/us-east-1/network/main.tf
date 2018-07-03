provider "google" {
  project     = "${var.project}"
  region = "${var.region}"
}


terraform {
  backend "gcs" {
    bucket = "terraform-state-sandbox-c4coin"
    prefix = "/us-east-1/network"
  }
}


resource "google_compute_network" "my_vpc" {
  name                    = "${var.vpc_name}"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "my_subnet" {
  name          = "${var.subnet_name}"
  ip_cidr_range = "${var.ip_cidr_range}"
  region        = "${var.region}"
  network       = "${google_compute_network.my_vpc.self_link}"
  private_ip_google_access = "${var.private_ip_google_access}"
  enable_flow_logs = "${var.enable_flow_logs}"
}




