variable "project_id" {
  description = "The project id to deploy Jenkins on GKE"
}

variable "tfstate_gcs_backend" {
  description = "Name of the GCS bucket to use as a backend for Terraform State"
  default     = "TFSTATE_GCS_BACKEND"
}

variable "region" {
  description = "The GCP region to deploy instances into"
  default     = "us-east4"
}

variable "zones" {
  description = "The GCP zone to deploy gke into"
  default     = ["us-east4-a"]
}

variable "ip_range_pods_name" {
  description = "The secondary ip range to use for pods"
  default     = "ip-range-pods"
}

variable "ip_range_services_name" {
  description = "The secondary ip range to use for pods"
  default     = "ip-range-scv"
}

variable "network_name" {
  description = "Name for the VPC network"
  default     = "jenkins-network"
}
variable "subnet_ip" {
  description = "IP range for the subnet"
  default     = "10.10.10.0/24"
}
variable "subnet_name" {
  description = "Name for the subnet"
  default     = "jenkins-subnet"
}

variable "jenkins_k8s_config" {
  description = "Name for the k8s secret required to configure k8s executers on Jenkins"
  default     = "jenkins-k8s-config"
}

variable "github_username" {
  description = "Github user/organization name where the terraform repo resides."
}

variable "github_token" {
  description = "Github token to access repo."
}

variable "github_repo" {
  description = "Github repo name."
  default     = "solutions-terraform-jenkins-gitops"
}
