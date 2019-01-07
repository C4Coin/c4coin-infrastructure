resource "google_container_node_pool" "nodes" {
  autoscaling {
    max_node_count = "${var.max_node_count}"
    min_node_count = "${var.min_node_count}"
  }

  initial_node_count = "${var.container_node_pool_initial_node_count}"

  //Uses a cluster nodeconfig
  //  node_config {
  //    disk_size_gb     = "${var.disk_size_gb}" //10
  //    image_type       = "${var.image_type}"
  //    min_cpu_platform = "${var.min_cpu_platform}"
  //  }

  cluster = "${google_container_cluster.primary.name}"
}

resource "google_container_cluster" "primary" {
  name               = "${var.gke_cluster_name}"       //"cluster-1"
  min_master_version = "${var.gke_min_master_version}" //"1.10.7-gke.6"
  node_version       = "${var.gke_node_version}"       //"1.10.7-gke.6"
  zone               = "${var.zone}"

  additional_zones = "${var.additional_zones}"

  description = "${var.gke_description}"

  initial_node_count = "${var.gke_initial_node_count}" //  The number of nodes to create in this cluster (not including the Kubernetes master). Must be set if node_pool is not set.

  enable_binary_authorization = "${var.enable_binary_authorization}"

  ip_allocation_policy {
    cluster_secondary_range_name  = "${var.cluster_secondary_range_name}"
    services_secondary_range_name = "${var.services_secondary_range_name}"
  }

  timeouts {
    create = "${var.cluster_create_timeout}"
    delete = "${var.cluster_delete_timeout}"
    update = "${var.cluster_update_timeout}"
  }

  resource_labels {}

  logging_service = "logging.googleapis.com" // logging.googleapis.com, logging.googleapis.com/kubernetes (beta), and none

  network_policy {
    enabled = true
  }

  pod_security_policy_config {
    enabled = false
  }

  addons_config {
    horizontal_pod_autoscaling {
      disabled = "${var.disable_horizontal_pod_autoscaling}" //true
    }

    http_load_balancing {
      disabled = "${var.disable_http_loadbalacing}" //true
    }

    kubernetes_dashboard {
      disabled = "${var.disable_k8s_dashboard}" //false
    }

    network_policy_config {
      disabled = "${var.disable_network_policy_config}" // true
    }
  }

  // master_authorized_networks_config - (Optional) The desired configuration options for master authorized networks.
  //Omit the nested cidr_blocks attribute to disallow external access (except the cluster node IPs, which GKE automatically whitelists).
  //  master_authorized_networks_config {
  //    cidr_blocks {
  //      cidr_block = ""
  //    }
  //  }

  master_auth {
    password = ""
    username = ""

    client_certificate_config {
      issue_client_certificate = "${var.issue_client_certificate}" //false
    }
  }
  cluster_ipv4_cidr       = "${var.cluster_ipv4_cidr}"
  enable_kubernetes_alpha = "${var.enable_kubernetes_alpha}" //false
  connection              = {}
  maintenance_policy {
    "daily_maintenance_window" {
      start_time = "${var.start_time}" //"03:00"
    }
  }
  subnetwork      = "${var.subnetwork}"
  private_cluster = "${var.private_cluster}"
  node_config {
    disk_size_gb = "${var.disk_size_gb}" // "10" Minimum
    disk_type    = "${var.disk_type}"    // "pd-ssd" //'pd-standard' or 'pd-ssd'

    guest_accelerator {
      count = "${var.guest_accelerator_count}" //0
      type  = "${var.guest_accelerator_type}"  //nvidia-tesla-k80
    }

    image_type = "${var.image_type}"
    labels     = {}

    local_ssd_count  = "${var.local_ssd_count}"
    machine_type     = "${var.machine_type}"     //n1-standard-1
    min_cpu_platform = "${var.min_cpu_platform}" // "Intel Sandy Bridge" "Intel Ivy Bridge" "Intel Haswell" "Intel Broadwell" "Intel Skylake"
    preemptible      = "${var.preemptible}"
  }

  // node_pool - (Optional) List of node pools associated with this cluster. See google_container_node_pool for schema.
  //  node_pool {}

  network            = ""
  monitoring_service = "monitoring.googleapis.com" // monitoring.googleapis.com, monitoring.googleapis.com/kubernetes (beta) and none
}
