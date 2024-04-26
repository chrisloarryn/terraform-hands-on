
locals {
  project_id = var.project_id

  cloud_run_role = "roles/run.invoker"
}


module "compute_engine" {
  source = "../../../../../../modules/compute-engine"
  compute_engine = {
    name        = "compute-engine"
    description = "My Compute Engine"
    cpu         = 8
    memory      = 512
    credentials = {
      path_to_credentials = var.path_to_credentials
    }
    zone         = var.region
    machine_type = "e2-micro"
    image        = "debian-cloud/debian-10"
    network_interface = {
      network    = "default"
      subnetwork = "default"
    }
    project_id = var.project_id
  }
}


resource "google_dns_managed_zone" "dns" {
  name        = "cymbal-dns"
  dns_name    = "cymbal.com."
  description = "Cymbal DNS"
  project     = var.project_id
}