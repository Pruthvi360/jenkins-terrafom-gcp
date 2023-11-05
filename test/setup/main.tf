module "project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 11.0"

  name              = "ci-jenkins-gke"
  random_project_id = "true"
  org_id            = var.org_id
  folder_id         = var.folder_id
  billing_account   = var.billing_account

  activate_apis = [
    "cloudresourcemanager.googleapis.com",
  ]
}

locals {
  int_required_roles = [
    "roles/container.admin",
    "roles/compute.securityAdmin",
    "roles/compute.admin",
  ]
}

resource "google_service_account" "int_test" {
  project      = module.project.project_id
  account_id   = "ci-jenkins-gke"
  display_name = "ci-jenkins-gke"
}

resource "google_project_iam_member" "int_test" {
  count = length(local.int_required_roles)

  project = module.project.project_id
  role    = local.int_required_roles[count.index]
  member  = "serviceAccount:${google_service_account.int_test.email}"
}

resource "google_service_account_key" "int_test" {
  service_account_id = google_service_account.int_test.id
}
