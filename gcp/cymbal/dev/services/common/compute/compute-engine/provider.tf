
provider "google" {
	credentials = file("../../../../../../keys/service-account.json")
  project     = var.compute_engine.project_id
  region      = "southamerica-west1"
  zone        = var.compute_engine.zone
}

terraform {
  required_version = ">= 1.2.5"
}