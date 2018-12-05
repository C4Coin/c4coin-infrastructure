##################################
#           Network
##################################
variable "project" {}
variable "region" {}
variable "zone" {}
variable "additional_zones" {
  type = "list"
}

##################################
#           Node
##################################

variable "max_node_count" {}
variable "min_node_count" {}
variable "disk_size_gb" {}
variable "image_type" {}
variable "min_cpu_platform" {}

variable "cluster" {}
variable "container_node_pool_initial_node_count" {}


##################################
#           Container Cluster
##################################

variable "gke_cluster_name" {}
variable "gke_min_master_version" {}
variable "gke_node_version" {}
variable "gke_description" {}
variable "gke_initial_node_count" {}
variable "enable_binary_authorization" {}
variable "cluster_secondary_range_name" {}
variable "services_secondary_range_name" {}


variable "cluster_create_timeout" {}
variable "cluster_delete_timeout" {}
variable "cluster_update_timeout" {}

variable "disable_horizontal_pod_autoscaling" {}
variable "disable_http_loadbalacing" {}
variable "disable_k8s_dashboard" {}
variable "disable_network_policy_config" {}

variable "issue_client_certificate" {}
variable "cluster_ipv4_cidr" {}
variable "enable_kubernetes_alpha" {}
variable "start_time" {}

variable "subnetwork" {}
variable "private_cluster" {}
variable "disk_type" {}
variable "guest_accelerator_count" {}

variable "guest_accelerator_type" {}
variable "local_ssd_count" {}
variable "machine_type" {}
variable "preemptible" {}
##################################
#
##################################