resource "google_cloud_scheduler_job" "job_morning" {
  name        = "daily-task-morning"
  description = "Tarea diaria para 8:55 AM de lunes a viernes"

  schedule  = "55 8 * * 1-5"
  time_zone = "America/Santiago" # Ajusta según tu zona horaria

  retry_config {
    retry_count          = 1
    min_backoff_duration = "5s"
    max_backoff_duration = "3600s"
    max_doublings        = 5
    max_retry_duration   = "0s"
  }

  attempt_deadline = "180s"

  http_target {
    uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/execute"
    http_method = "POST"
    body = base64encode(jsonencode({
      rut      = "189795696"
      password = "5862"
    }))
    headers = {
      "Content-Type" = "application/json"
    }
  }
}

resource "google_cloud_scheduler_job" "job_afternoon_mon_thu" {
  name        = "daily-task-afternoon-mon-thu"
  description = "Tarea diaria para 19:04 de lunes a jueves"

  schedule  = "4 19 * * 1-4"
  time_zone = "America/Santiago" # Ajusta según tu zona horaria

  retry_config {
    retry_count          = 1
    min_backoff_duration = "5s"
    max_backoff_duration = "3600s"
    max_doublings        = 5
    max_retry_duration   = "0s"
  }

  attempt_deadline = "180s"

  http_target {
    uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/execute"
    http_method = "POST"
    body = base64encode(jsonencode({
      rut      = "189795696"
      password = "5862"
    }))
    headers = {
      "Content-Type" = "application/json"
    }
  }
}

resource "google_cloud_scheduler_job" "job_friday" {
  name        = "daily-task-friday"
  description = "Tarea diaria para 16:47 el viernes"

  schedule  = "47 16 * * 5"
  time_zone = "America/Santiago" # Ajusta según tu zona horaria

  # max retry attempts
  retry_config {
    retry_count          = 1
    min_backoff_duration = "5s"
    max_backoff_duration = "3600s"
    max_doublings        = 5
    max_retry_duration   = "0s"
  }

  attempt_deadline = "180s"

  http_target {
    uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/execute"
    http_method = "POST"
    body = base64encode(jsonencode({
      rut      = "189795696"
      password = "5862"
    }))
    headers = {
      "Content-Type" = "application/json"
    }
  }
}