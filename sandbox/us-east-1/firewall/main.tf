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

resource "google_compute_firewall" "allow-ssh" {
  name = "${var.vpc_name}-allow-ssh"
  network = "${var.vpc_name}"

  allow {
    protocol = "tcp"
    ports = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-gw-egress" {
  name = "${var.vpc_name}-allow-gw-egress"
  network = "${var.vpc_name}"

  allow {
    protocol = "tcp"
    ports = ["80","443"]
  }

  target_tags = ["gw"]
  source_tags = ["web", "app"]
}

resource "google_compute_firewall" "allow-gw-traceroute" {
  name = "${var.vpc_name}-allow-gw-traceroute"
  network = "${var.vpc_name}"

  allow {
    protocol = "udp"
    ports = ["33434-33534"]
  }

  target_tags = ["gw"]
  source_ranges = ["10.0.0.0/20"]
}

resource "google_compute_firewall" "allow-web" {
  name = "${var.vpc_name}-allow-web"
  network = "${var.vpc_name}"

  allow {
    protocol = "tcp"
    ports = ["22", "80"]
  }

  target_tags = ["web"]
  source_tags = ["web", "gw"]
}

resource "google_compute_firewall" "allow-app" {
  name = "${var.vpc_name}-allow-app"
  network = "${var.vpc_name}"

  allow {
    protocol = "tcp"
    ports = ["22", "80"]
  }

  target_tags = ["app"]
  source_tags = ["app", "gw"]
}






