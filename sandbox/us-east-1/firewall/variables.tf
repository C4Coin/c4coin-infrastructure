
variable "project" {}
variable "region" {}

#firewall
variable "vpc_name" {}
variable "protocol" {}
variable "firewall_name" {}

variable ports {
  description = "List of ports and/or port ranges to allow. This can only be specified if the protocol is TCP or UDP"
  type        = "list"
}

variable source_ranges {
  description = "A list of source CIDR ranges that this firewall applies to. Can't be used for EGRESS"
  type        = "list"
}

