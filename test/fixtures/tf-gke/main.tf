resource "google_storage_bucket" "tfb" {
  name                        = "${var.project_id}-tf-backend"
  project                     = var.project_id
  location                    = "US"
  force_destroy               = true
  uniform_bucket_level_access = true
}

module "tf-gke" {
  source                 = "../../../jenkins-gke/tf-gke"
  project_id             = var.project_id
  tfstate_gcs_backend    = google_storage_bucket.tfb.name
  region                 = "us-east4"
  zones                  = ["us-east4-a"]
  ip_range_pods_name     = "ip-range-pods"
  ip_range_services_name = "ip-range-scv"
  network_name           = "jenkins-network"
  subnet_ip              = "10.10.10.0/24"
  subnet_name            = "jenkins-subnet"
  jenkins_k8s_config     = "jenkins-k8s-config"
  github_username        = "test"
  github_token           = "test"
}
