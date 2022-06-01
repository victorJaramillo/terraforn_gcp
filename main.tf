resource "google_container_cluster" "accenture_kube" {
  name        = var.name
  project     = var.project
  description = "GKE Cluster"
  location    = var.location

  enable_legacy_abac       = true
  remove_default_node_pool = true
  initial_node_count       = var.initial_node_count

  master_auth {

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "accenture_kube" {
  name       = "${var.name}-node-pool"
  project    = var.project
  location   = var.location
  cluster    = google_container_cluster.accenture_kube.name
  node_count = var.initial_node_count


  node_config {
    preemptible  = true
    machine_type = var.machine_type
    tags         = ["gke-node", "${var.project}-gke"]

    labels = {
      env = var.project
    }

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
