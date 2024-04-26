
provider "google" {
  credentials = file("../../../../../../keys/sa.json")
  project     = var.project_id
  region      = "southamerica-west1"
  zone        = var.region
}

terraform {
  required_version = ">= 1.2.5"
}