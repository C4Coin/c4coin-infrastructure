provider "google" {
  project     = "${var.project}"
  region = "${var.region}"
}


terraform {
  backend "gcs" {
    bucket = "terraform-state-sandbox-c4coin"
    prefix = "/us-east-1/firewall"
  }
}



resource "google_compute_firewall" "allow-icmp" {
  name = "${var.vpc_name}-allow-icmp"
  network = "${var.vpc_name}"

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}






