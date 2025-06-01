resource "google_cloud_scheduler_job" "job" {
  for_each = local.scheduler_jobs

  name        = each.value.name
  description = each.value.description
  schedule    = each.value.schedule
  time_zone   = "America/Santiago"

  http_target {
    uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/v2/execute"
    http_method = "POST"

    body = base64encode(jsonencode({
      rut      = each.value.rut
      password = each.value.password
    }))

    headers = {
      "Content-Type" = "application/json"
    }

    oidc_token {
      service_account_email = "chrisloarryn@gcp-course-2024.iam.gserviceaccount.com"
    }
  }

  retry_config {
    retry_count          = 4
    max_retry_duration   = "900s"
    min_backoff_duration = "60s"
    max_backoff_duration = "240s"
    max_doublings        = 2
  }
}



# marker-variation makes a post json request to: https://us-central1-gcp-course-2024.cloudfunctions.net/marker-variation
# with the following body: {"project_id":"gcp-course-2024","region":"us-central1"}
# needs to be executed every at 8:25 AM from Monday to Friday and at 16:25 PM from Monday to Friday
resource "google_cloud_scheduler_job" "marker_variation" {
  name        = "marker-variation"
  description = "Tarea diaria para 8:25 AM y 13:25 PM de lunes a vierness"

  schedule  = "25 8,13 * * 1-5"
  time_zone = "America/Santiago" # Ajusta según tu zona horaria

  http_target {
    uri         = "https://southamerica-west1-gcp-course-2024.cloudfunctions.net/marker-variation"
    http_method = "POST"
    body = base64encode(jsonencode({
      project_id = "gcp-course-2024"
      region     = "us-central1"
    }))
    headers = {
      "Content-Type" = "application/json"
    }

    # Configuración OIDC
    oidc_token {
      service_account_email = "chrisloarryn@gcp-course-2024.iam.gserviceaccount.com"
    }
  }
}