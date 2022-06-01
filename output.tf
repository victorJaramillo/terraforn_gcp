# resource "local_file" "kubernetes_config" {
#   content = google_container_cluster.accenture_kube_name.kuber_config.0.raw_config
#   filename = "kebeconfig.yml"
# }

output "master_version" {
  value = google_container_cluster.accenture_kube.master_version
}

output "region" {
  value       = var.location
  description = "GCloud Region"
}

output "project" {
  value       = var.project
  description = "GCloud Project ID"
}

output "kubernetes_cluster_name" {
  value       = google_container_cluster.accenture_kube.name
  description = "GKE Cluster Name"
}

output "kubernetes_cluster_host" {
  value       = google_container_cluster.accenture_kube.endpoint
  description = "GKE Cluster Host"
}
