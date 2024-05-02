
provider "google" {
  credentials = file("../../../../../../keys/service-account.json")
  project     = var.project_id
  region      = "us-central1"
  zone        = var.region
}

terraform {
  required_version = ">= 1.2.5"
}