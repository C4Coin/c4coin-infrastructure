#############################################################################
#                             GCP Network
#############################################################################
zone = "us-central1-a"

region = "us-central1"

project = ""  // Fill this

subnetwork = ""

additional_zones = ["us-central1-b", "us-central1-c"]

#############################################################################
#                             Cluster
#############################################################################

cluster = "c4coin"

////// Container Cluster
gke_cluster_name = "c4coin"

gke_min_master_version = "1.10.9-gke.5"

gke_description = "C4 Coin K8s cluster"

gke_initial_node_count = 3

cluster_ipv4_cidr = ""

enable_binary_authorization = "true"

#############################################################################
#                             Cluster IP Allocation Policy
#############################################################################

cluster_secondary_range_name = ""

services_secondary_range_name = ""

#############################################################################
#                             Node
#############################################################################
container_node_pool_initial_node_count = 2

gke_node_version = "1.10.9-gke.5"

#############################################################################
#                             Cluster Config
#############################################################################

disable_horizontal_pod_autoscaling = "true"

disable_http_loadbalacing = "true"

disable_k8s_dashboard = "false"

disable_network_policy_config = "true"

enable_kubernetes_alpha = "false"

issue_client_certificate = "false"

private_cluster = ""

start_time = "03:00"

#############################################################################
#                             Node Config
#############################################################################
disk_size_gb = 10

disk_type = "pd-ssd"

image_type = ""

local_ssd_count = "1"

machine_type = "n1-standard-1"

min_cpu_platform = "Intel Skylake"

preemptible = ""

guest_accelerator_count = 0

guest_accelerator_type = ""

#############################################################################
#                             Node Pool
#############################################################################
max_node_count = 2

min_node_count = 1

container_node_pool_initial_node_count = 1

#############################################################################
#                             Volume
#############################################################################

#############################################################################
#                             Timeout
#############################################################################
cluster_create_timeout = "10m"

cluster_delete_timeout = "10m"

cluster_update_timeout = "10m"

#############################################################################

