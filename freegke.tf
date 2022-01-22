resource "google_container_cluster" "primary"{
  name     = "myfreegke-zonal"
  project = "myfreegke"
  location = "us-central1-a"
  network    = "default"
  subnetwork = "default"
  enable_autopilot = true
}
