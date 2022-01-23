variable "zone" {
  type = string
  default = "us-central1-a"
}
variable "region" {
  type = string
  default = "us-central1"
}
variable "cluster" {
  type = string
  default = "myfreegke"
}
variable "project" {
  type = string
  default = "myfreegke"
}
variable "node_preemptible" {
  type = bool
  default = true
}
variable "node_machine_type" {
  type = string
  default = "g1-small"
}
variable "node_tags" {
  type = list
  default = ["freegke"]
}
 resource "google_container_cluster" "main"{
   name     = var.cluster
   project = var.project
   location = var.zone
   network    = "default"
   subnetwork = "default"
   remove_default_node_pool = true
   initial_node_count       = 1
 }
resource "google_container_node_pool" "primary_preemptible_nodes" {
  project           = var.project
  provider          = google
  name              = format("%s-%s", var.project , "nodepool")
  location          = var.zone
  node_locations    = [var.zone]
  cluster           = var.cluster
  version           = google_container_cluster.main.master_version
  max_pods_per_node = 20
  node_count        = 1
  lifecycle {
    ignore_changes = [node_count, version]
  }

  node_config {
    preemptible  = var.node_preemptible
    machine_type = var.node_machine_type
    tags         = var.node_tags
    labels       = {}
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/cloudkms",
      "https://www.googleapis.com/auth/devstorage.read_write",
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}
