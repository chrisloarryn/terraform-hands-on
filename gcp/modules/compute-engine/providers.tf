terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.51.0, <= 5.22.0"
    }
  }

  required_version = ">= 1.2.5"
}

provider "google" {
  credentials = file(var.compute_engine.credentials.path_to_credentials)
  project     = var.compute_engine.project_id
  region      = "southamerica-west1"
  zone        = var.compute_engine.zone
}
