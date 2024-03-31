
locals {
  project_id     = var.project_id
  mongo_db_uri   = var.mongo_db_uri
  mongo_db_name  = var.mongo_db_name
  service_name   = var.service_name
  location       = var.region
  cloud_run_role = "roles/run.invoker"
}

module "cloud_run_prod" {
  source = "../../../../../modules/cloud_run"
  cloud_run = {
    // "${var.cloud_run.}-docker.pkg.dev/${var.project_id}/cloud-run-source-deploy/movil-app-backend-dev:latest"
    container_image      = "${local.location}-docker.pkg.dev/${var.project_id}/${var.artifact_repository_id}/${var.service_name}-${var.environment}:latest"
    cloud_run_name       = var.service_name
    project_id              = local.project_id
    location             = local.location
    cloud_run_role       = local.cloud_run_role
    min_instances        = 1
    max_instances        = 3
    container_port       = 3000
    members              = ["allUsers"]
    service_account_name = var.client_email
    mongo_db_uri         = local.mongo_db_uri
    mongo_db_name        = local.mongo_db_name
    environment_running  = var.environment
    google_cloud_json_b64 = var.google_cloud_json_b64
  }
}
