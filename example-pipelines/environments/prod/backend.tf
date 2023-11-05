terraform {
  backend "gcs" {
    bucket = "new-ansible-354213-tfstate"
    prefix = "env/prod"
  }
}
