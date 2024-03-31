// create or validate an artifact registry repository called "cloud-run-source-deploy"
resource "google_artifact_registry_repository" "cloud-run-source-deploy" {
  repository_id = var.repository_id
  location = var.region
  format = "DOCKER"
  description = "Repository for storing images to deploy to Cloud Run"
  lifecycle {
    ignore_changes = [
        location,
        format,
        description,
    ]
  }
}
