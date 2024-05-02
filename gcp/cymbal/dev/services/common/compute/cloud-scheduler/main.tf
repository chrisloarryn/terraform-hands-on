resource "google_cloud_scheduler_job" "job_morning" {
  name        = "daily-task-morning"
  description = "Tarea diaria para 8:55 AM de lunes a viernes"

  schedule  = "55 8 * * 1-5"
  time_zone = "America/Santiago" # Ajusta según tu zona horaria

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

    # Configuración OIDC
    oidc_token {
      service_account_email = "chrisloarryn@gcp-course-2024.iam.gserviceaccount.com"
      audience              = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app"
    }
  }
}

resource "google_cloud_scheduler_job" "job_afternoon_mon_thu" {
  name        = "daily-task-afternoon-mon-thu"
  description = "Tarea diaria para 19:04 de lunes a jueves"

  schedule  = "4 19 * * 1-4"
  time_zone = "America/Santiago" # Ajusta según tu zona horaria

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

    # Configuración OIDC
    oidc_token {
      service_account_email = "chrisloarryn@gcp-course-2024.iam.gserviceaccount.com"
      audience              = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app"
    }
  }
}

resource "google_cloud_scheduler_job" "job_friday" {
  name        = "daily-task-friday"
  description = "Tarea diaria para 16:47 el viernes"

  schedule  = "47 16 * * 5"
  time_zone = "America/Santiago" # Ajusta según tu zona horaria

  # max retry attempt

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

    # Configuración OIDC
    oidc_token {
      service_account_email = "chrisloarryn@gcp-course-2024.iam.gserviceaccount.com"
      audience              = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app"
    }
  }
}

# marker-variation makes a post json request to: https://us-central1-gcp-course-2024.cloudfunctions.net/marker-variation
# with the following body: {"project_id":"gcp-course-2024","region":"us-central1"}
# needs to be executed every at 8:25 AM from Monday to Friday and at 16:25 PM from Monday to Friday
resource "google_cloud_scheduler_job" "marker_variation" {
  name        = "marker-variation"
  description = "Tarea diaria para 8:25 AM y 16:25 PM de lunes a viernes"

  schedule  = "25 8,16 * * 1-5"
  time_zone = "America/Santiago" # Ajusta según tu zona horaria

  http_target {
    uri         = "https://us-central1-gcp-course-2024.cloudfunctions.net/marker-variation"
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
      audience              = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app"
    }
  }
}


/// API


resource "google_cloud_scheduler_job" "job_morning_api" {
  name        = "daily-task-morning-api"
  description = "Tarea diaria para 8:55 AM de lunes a viernes API"

  schedule  = "55 8 * * 1-5"
  time_zone = "America/Santiago" # Ajusta según tu zona horaria

  http_target {
    uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/execute"
    http_method = "POST"
    body = base64encode(jsonencode({
      rut      = "192935423"
      password = "9761"
    }))
    headers = {
      "Content-Type" = "application/json"
    }

    # Configuración OIDC
    oidc_token {
      service_account_email = "chrisloarryn@gcp-course-2024.iam.gserviceaccount.com"
      audience              = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app"
    }
  }
}

resource "google_cloud_scheduler_job" "job_afternoon_mon_thu_api" {
  name        = "daily-task-afternoon-mon-thu-api"
  description = "Tarea diaria para 19:04 de lunes a jueves API"

  schedule  = "4 19 * * 1-4"
  time_zone = "America/Santiago" # Ajusta según tu zona horaria

  http_target {
    uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/execute"
    http_method = "POST"
    body = base64encode(jsonencode({
      rut      = "192935423"
      password = "9761"
    }))
    headers = {
      "Content-Type" = "application/json"
    }

    # Configuración OIDC
    oidc_token {
      service_account_email = "chrisloarryn@gcp-course-2024.iam.gserviceaccount.com"
      audience              = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app"
    }
  }
}

resource "google_cloud_scheduler_job" "job_friday_api" {
  name        = "daily-task-friday-api"
  description = "Tarea diaria para 16:47 el viernes API"

  schedule  = "47 16 * * 5"
  time_zone = "America/Santiago" # Ajusta según tu zona horaria

  # max retry attempt

  http_target {
    uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/execute"
    http_method = "POST"
    body = base64encode(jsonencode({
      rut      = "192935423"
      password = "9761"
    }))
    headers = {
      "Content-Type" = "application/json"
    }

    # Configuración OIDC
    oidc_token {
      service_account_email = "chrisloarryn@gcp-course-2024.iam.gserviceaccount.com"
      audience              = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app"
    }
  }
}