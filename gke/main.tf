provider "google" {
  version = "1.19.1"
  project = "${var.project}" //"c4coin-205301"
  region  = "${var.region}"  //"us-central1"
  zone    = "${var.zone}"    //"us-central1-c"
}

provider "google-beta" {
  version     = "1.19.0"
  credentials = "${file("account.json")}"
  project     = "${var.project}"          //"c4coin-205301"
  region      = "${var.region}"           //"us-central1"
  zone        = "${var.zone}"             //"us-central1-c"
}

module "gke" {
  source = "../modules/gke"

  #############################################################################
  #                             GCP Network
  #############################################################################

  subnetwork       = "${var.subnetwork}"
  zone             = "${var.zone}"
  additional_zones = "${var.additional_zones}"
  region           = "${var.region}"

  #############################################################################
  #                             Cluster
  #############################################################################

  gke_cluster_name            = "${var.gke_cluster_name}"
  gke_description             = "${var.gke_description}"
  gke_min_master_version      = "${var.gke_min_master_version}"
  gke_initial_node_count      = "${var.gke_initial_node_count}"
  cluster                     = "${var.cluster}"
  cluster_ipv4_cidr           = "${var.cluster_ipv4_cidr}"
  enable_binary_authorization = "${var.enable_binary_authorization}"

  #############################################################################
  #                             Cluster IP Allocation Policy
  #############################################################################

  cluster_secondary_range_name  = "${var.cluster_secondary_range_name}"
  services_secondary_range_name = "${var.services_secondary_range_name}"

  #############################################################################
  #                             Node
  #############################################################################

  container_node_pool_initial_node_count = "${var.container_node_pool_initial_node_count}"
  gke_node_version                       = "${var.gke_node_version}"

  #############################################################################
  #                             Cluster Config
  #############################################################################

  disable_horizontal_pod_autoscaling = "${var.disable_horizontal_pod_autoscaling}"
  disable_http_loadbalacing          = "${var.disable_http_loadbalacing}"
  disable_k8s_dashboard              = "${var.disable_k8s_dashboard}"
  disable_network_policy_config      = "${var.disable_network_policy_config}"
  enable_kubernetes_alpha            = "${var.enable_kubernetes_alpha}"
  issue_client_certificate           = "${var.issue_client_certificate}"
  private_cluster                    = "${var.private_cluster}"
  project                            = "${var.project}"
  start_time                         = "${var.start_time}"

  #############################################################################
  #                             Node Config
  #############################################################################

  disk_size_gb            = "${var.disk_size_gb}"
  disk_type               = "${var.disk_type}"
  image_type              = "${var.image_type}"
  local_ssd_count         = "${var.local_ssd_count}"
  machine_type            = "${var.machine_type}"
  min_cpu_platform        = "${var.min_cpu_platform}"
  preemptible             = "${var.preemptible}"
  guest_accelerator_count = "${var.guest_accelerator_count}"
  guest_accelerator_type  = "${var.guest_accelerator_type}"

  #############################################################################
  #                             Node Pool
  #############################################################################

  max_node_count     = "${var.max_node_count}"
  min_node_count     = "${var.min_node_count}"
//  initial_node_count = "${var.gke_initial_node_count}"


  #############################################################################
  #                             Timeout
  #############################################################################
  cluster_create_timeout = "${var.cluster_create_timeout}"
  cluster_update_timeout = "${var.cluster_update_timeout}"
  cluster_delete_timeout = "${var.cluster_delete_timeout}"

  #############################################################################
}
