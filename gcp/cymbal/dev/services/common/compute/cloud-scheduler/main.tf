resource "google_cloud_scheduler_job" "job_morning" {
  name        = "daily-task-morning"
  description = "Tarea diaria para 8:55 AM de lunes a viernes"

  schedule  = "55 8 * * 1-5"
  time_zone = "America/Santiago" # Ajusta según tu zona horaria

  http_target {
    uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/v2/execute"
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
    }
  }

  retry_config {
    retry_count          = 4      # 5 intentos en total (1 inicial + 4 reintentos)
    max_retry_duration   = "900s" # 15 minutos
    min_backoff_duration = "60s"  # primer reintento al minuto
    max_backoff_duration = "240s" # nunca esperará más de 4 min
    max_doublings        = 2      # 60 s → 120 s → 240 s → 240 s
  }
}

resource "google_cloud_scheduler_job" "job_afternoon_mon_thu" {
  name        = "daily-task-afternoon-mon-thu"
  description = "Tarea diaria para 19:04 de lunes a jueves"

  schedule  = "4 19 * * 1-4"
  time_zone = "America/Santiago" # Ajusta según tu zona horaria

  http_target {
    uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/v2/execute"
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
    }
  }

  retry_config {
    retry_count          = 4      # 5 intentos en total (1 inicial + 4 reintentos)
    max_retry_duration   = "900s" # 15 minutos
    min_backoff_duration = "60s"  # primer reintento al minuto
    max_backoff_duration = "240s" # nunca esperará más de 4 min
    max_doublings        = 2      # 60 s → 120 s → 240 s → 240 s
  }
}

resource "google_cloud_scheduler_job" "job_friday" {
  name        = "daily-task-friday"
  description = "Tarea diaria para 16:47 el viernes"

  schedule  = "47 16 * * 5"
  time_zone = "America/Santiago" # Ajusta según tu zona horaria

  # max retry attempt

  http_target {
    uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/v2/execute"
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
    }
  }

  retry_config {
    retry_count          = 4      # 5 intentos en total (1 inicial + 4 reintentos)
    max_retry_duration   = "900s" # 15 minutos
    min_backoff_duration = "60s"  # primer reintento al minuto
    max_backoff_duration = "240s" # nunca esperará más de 4 min
    max_doublings        = 2      # 60 s → 120 s → 240 s → 240 s
  }
}

# other markers at: 13:30 and at 14:15
# job at 13:30
resource "google_cloud_scheduler_job" "job_13_30" {
  name        = "daily-task-13-30"
  description = "Tarea diaria para 13:30"

  schedule  = "30 13 * * 1-5"
  time_zone = "America/Santiago" # Ajusta según tu zona horaria

  http_target {
    uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/v2/execute"
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
    }
  }

  retry_config {
    retry_count          = 4      # 5 intentos en total (1 inicial + 4 reintentos)
    max_retry_duration   = "900s" # 15 minutos
    min_backoff_duration = "60s"  # primer reintento al minuto
    max_backoff_duration = "240s" # nunca esperará más de 4 min
    max_doublings        = 2      # 60 s → 120 s → 240 s → 240 s
  }
}

# job at 14:15
resource "google_cloud_scheduler_job" "job_14_15" {
  name        = "daily-task-14-15"
  description = "Tarea diaria para 14:15"

  schedule  = "15 14 * * 1-5"
  time_zone = "America/Santiago" # Ajusta según tu zona horaria

  http_target {
    uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/v2/execute"
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
    }
  }

  retry_config {
    retry_count          = 4      # 5 intentos en total (1 inicial + 4 reintentos)
    max_retry_duration   = "900s" # 15 minutos
    min_backoff_duration = "60s"  # primer reintento al minuto
    max_backoff_duration = "240s" # nunca esperará más de 4 min
    max_doublings        = 2      # 60 s → 120 s → 240 s → 240 s
  }
}



/// SCHEDULER JOBS *-jomo
resource "google_cloud_scheduler_job" "job_morning_jomo" {
  name        = "daily-task-morning-jomo"
  description = "Tarea diaria para 8:55 AM de lunes a viernes API"

  schedule  = "55 8 * * 1-5"
  time_zone = "America/Santiago" # Ajusta según tu zona horaria

  http_target {
    uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/v2/execute"
    http_method = "POST"
    body = base64encode(jsonencode({
      rut      = "137256762"
      password = "5586"
    }))
    headers = {
      "Content-Type" = "application/json"
    }

    # Configuración OIDC
    oidc_token {
      service_account_email = "chrisloarryn@gcp-course-2024.iam.gserviceaccount.com"
    }
  }

  retry_config {
    retry_count          = 4      # 5 intentos en total (1 inicial + 4 reintentos)
    max_retry_duration   = "900s" # 15 minutos
    min_backoff_duration = "60s"  # primer reintento al minuto
    max_backoff_duration = "240s" # nunca esperará más de 4 min
    max_doublings        = 2      # 60 s → 120 s → 240 s → 240 s
  }
}

resource "google_cloud_scheduler_job" "job_afternoon_mon_thu_jomo" {
  name        = "daily-task-afternoon-mon-thu-jomo"
  description = "Tarea diaria para 19:04 de lunes a jueves API"

  schedule  = "4 19 * * 1-4"
  time_zone = "America/Santiago" # Ajusta según tu zona horaria

  http_target {
    uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/v2/execute"
    http_method = "POST"
    body = base64encode(jsonencode({
      rut      = "137256762"
      password = "5586"
    }))
    headers = {
      "Content-Type" = "application/json"
    }

    # Configuración OIDC
    oidc_token {
      service_account_email = "chrisloarryn@gcp-course-2024.iam.gserviceaccount.com"
    }
  }

  retry_config {
    retry_count          = 4      # 5 intentos en total (1 inicial + 4 reintentos)
    max_retry_duration   = "900s" # 15 minutos
    min_backoff_duration = "60s"  # primer reintento al minuto
    max_backoff_duration = "240s" # nunca esperará más de 4 min
    max_doublings        = 2      # 60 s → 120 s → 240 s → 240 s
  }
}

resource "google_cloud_scheduler_job" "job_friday_jomo" {
  name        = "daily-task-friday-jomo"
  description = "Tarea diaria para 16:47 el viernes API"

  schedule  = "47 16 * * 5"
  time_zone = "America/Santiago" # Ajusta según tu zona horaria

  # max retry attempt

  http_target {
    uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/v2/execute"
    http_method = "POST"
    body = base64encode(jsonencode({
      rut      = "137256762"
      password = "5586"
    }))
    headers = {
      "Content-Type" = "application/json"
    }

    # Configuración OIDC
    oidc_token {
      service_account_email = "chrisloarryn@gcp-course-2024.iam.gserviceaccount.com"
    }
  }

  retry_config {
    retry_count          = 4      # 5 intentos en total (1 inicial + 4 reintentos)
    max_retry_duration   = "900s" # 15 minutos
    min_backoff_duration = "60s"  # primer reintento al minuto
    max_backoff_duration = "240s" # nunca esperará más de 4 min
    max_doublings        = 2      # 60 s → 120 s → 240 s → 240 s
  }
}

# other markers at: 13:30 and at 14:15
# job at 13:30
resource "google_cloud_scheduler_job" "job_13_30_jomo" {
  name        = "daily-task-13-30-jomo"
  description = "Tarea diaria para 13:30 API"

  schedule  = "30 13 * * 1-5"
  time_zone = "America/Santiago" # Ajusta según tu zona horaria

  http_target {
    uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/v2/execute"
    http_method = "POST"
    body = base64encode(jsonencode({
      rut      = "137256762"
      password = "5586"
    }))
    headers = {
      "Content-Type" = "application/json"
    }

    # Configuración OIDC
    oidc_token {
      service_account_email = "chrisloarryn@gcp-course-2024.iam.gserviceaccount.com"
    }
  }

  retry_config {
    retry_count          = 4      # 5 intentos en total (1 inicial + 4 reintentos)
    max_retry_duration   = "900s" # 15 minutos
    min_backoff_duration = "60s"  # primer reintento al minuto
    max_backoff_duration = "240s" # nunca esperará más de 4 min
    max_doublings        = 2      # 60 s → 120 s → 240 s → 240 s
  }
}

# job at 14:15
resource "google_cloud_scheduler_job" "job_14_15_jomo" {
  name        = "daily-task-14-15-jomo"
  description = "Tarea diaria para 14:15 API"

  schedule  = "15 14 * * 1-5"
  time_zone = "America/Santiago" # Ajusta según tu zona horaria

  http_target {
    uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/v2/execute"
    http_method = "POST"
    body = base64encode(jsonencode({
      rut      = "137256762"
      password = "5586"
    }))
    headers = {
      "Content-Type" = "application/json"
    }

    # Configuración OIDC
    oidc_token {
      service_account_email = "chrisloarryn@gcp-course-2024.iam.gserviceaccount.com"
    }
  }

  retry_config {
    retry_count          = 4      # 5 intentos en total (1 inicial + 4 reintentos)
    max_retry_duration   = "900s" # 15 minutos
    min_backoff_duration = "60s"  # primer reintento al minuto
    max_backoff_duration = "240s" # nunca esperará más de 4 min
    max_doublings        = 2      # 60 s → 120 s → 240 s → 240 s
  }
}


/// SCHEDULER JOBS *-frapac
resource "google_cloud_scheduler_job" "job_morning_frapac" {
  name        = "daily-task-morning-frapac"
  description = "Tarea diaria para 8:55 AM de lunes a viernes API"

  schedule  = "55 8 * * 1-5"
  time_zone = "America/Santiago" # Ajusta según tu zona horaria

  http_target {
    uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/v2/execute"
    http_method = "POST"
    body = base64encode(jsonencode({
      rut      = "138406253"
      password = "2435"
    }))
    headers = {
      "Content-Type" = "application/json"
    }

    # Configuración OIDC
    oidc_token {
      service_account_email = "chrisloarryn@gcp-course-2024.iam.gserviceaccount.com"
    }
  }

  retry_config {
    retry_count          = 4      # 5 intentos en total (1 inicial + 4 reintentos)
    max_retry_duration   = "900s" # 15 minutos
    min_backoff_duration = "60s"  # primer reintento al minuto
    max_backoff_duration = "240s" # nunca esperará más de 4 min
    max_doublings        = 2      # 60 s → 120 s → 240 s → 240 s
  }
}

resource "google_cloud_scheduler_job" "job_afternoon_mon_thu_frapac" {
  name        = "daily-task-afternoon-mon-thu-frapac"
  description = "Tarea diaria para 19:04 de lunes a jueves API"

  schedule  = "4 19 * * 1-4"
  time_zone = "America/Santiago" # Ajusta según tu zona horaria

  http_target {
    uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/v2/execute"
    http_method = "POST"
    body = base64encode(jsonencode({
      rut      = "138406253"
      password = "2435"
    }))
    headers = {
      "Content-Type" = "application/json"
    }

    # Configuración OIDC
    oidc_token {
      service_account_email = "chrisloarryn@gcp-course-2024.iam.gserviceaccount.com"
    }
  }

  retry_config {
    retry_count          = 4      # 5 intentos en total (1 inicial + 4 reintentos)
    max_retry_duration   = "900s" # 15 minutos
    min_backoff_duration = "60s"  # primer reintento al minuto
    max_backoff_duration = "240s" # nunca esperará más de 4 min
    max_doublings        = 2      # 60 s → 120 s → 240 s → 240 s
  }
}

resource "google_cloud_scheduler_job" "job_friday_frapac" {
  name        = "daily-task-friday-frapac"
  description = "Tarea diaria para 16:47 el viernes API"

  schedule  = "47 16 * * 5"
  time_zone = "America/Santiago" # Ajusta según tu zona horaria

  # max retry attempt

  http_target {
    uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/v2/execute"
    http_method = "POST"
    body = base64encode(jsonencode({
      rut      = "138406253"
      password = "2435"
    }))
    headers = {
      "Content-Type" = "application/json"
    }

    # Configuración OIDC
    oidc_token {
      service_account_email = "chrisloarryn@gcp-course-2024.iam.gserviceaccount.com"
    }
  }

  retry_config {
    retry_count          = 4      # 5 intentos en total (1 inicial + 4 reintentos)
    max_retry_duration   = "900s" # 15 minutos
    min_backoff_duration = "60s"  # primer reintento al minuto
    max_backoff_duration = "240s" # nunca esperará más de 4 min
    max_doublings        = 2      # 60 s → 120 s → 240 s → 240 s
  }
}

# other markers at: 13:30 and at 14:15
# job at 13:30
resource "google_cloud_scheduler_job" "job_13_30_frapac" {
  name        = "daily-task-13-30-frapac"
  description = "Tarea diaria para 13:30 API"

  schedule  = "30 13 * * 1-5"
  time_zone = "America/Santiago" # Ajusta según tu zona horaria

  http_target {
    uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/v2/execute"
    http_method = "POST"
    body = base64encode(jsonencode({
      rut      = "138406253"
      password = "2435"
    }))
    headers = {
      "Content-Type" = "application/json"
    }

    # Configuración OIDC
    oidc_token {
      service_account_email = "chrisloarryn@gcp-course-2024.iam.gserviceaccount.com"
    }
  }

  retry_config {
    retry_count          = 4      # 5 intentos en total (1 inicial + 4 reintentos)
    max_retry_duration   = "900s" # 15 minutos
    min_backoff_duration = "60s"  # primer reintento al minuto
    max_backoff_duration = "240s" # nunca esperará más de 4 min
    max_doublings        = 2      # 60 s → 120 s → 240 s → 240 s
  }
}

# job at 14:15
resource "google_cloud_scheduler_job" "job_14_15_frapac" {
  name        = "daily-task-14-15-frapac"
  description = "Tarea diaria para 14:15 API"

  schedule  = "15 14 * * 1-5"
  time_zone = "America/Santiago" # Ajusta según tu zona horaria

  http_target {
    uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/v2/execute"
    http_method = "POST"
    body = base64encode(jsonencode({
      rut      = "138406253"
      password = "2435"
    }))
    headers = {
      "Content-Type" = "application/json"
    }

    # Configuración OIDC
    oidc_token {
      service_account_email = "chrisloarryn@gcp-course-2024.iam.gserviceaccount.com"
    }
  }

  retry_config {
    retry_count          = 4      # 5 intentos en total (1 inicial + 4 reintentos)
    max_retry_duration   = "900s" # 15 minutos
    min_backoff_duration = "60s"  # primer reintento al minuto
    max_backoff_duration = "240s" # nunca esperará más de 4 min
    max_doublings        = 2      # 60 s → 120 s → 240 s → 240 s
  }
}


# marker-variation makes a post json request to: https://us-central1-gcp-course-2024.cloudfunctions.net/marker-variation
# with the following body: {"project_id":"gcp-course-2024","region":"us-central1"}
# needs to be executed every at 8:25 AM from Monday to Friday and at 16:25 PM from Monday to Friday
resource "google_cloud_scheduler_job" "marker_variation" {
  name        = "marker-variation"
  description = "Tarea diaria para 8:25 AM y 13:25 PM de lunes a viernes"

  schedule  = "25 8,13 * * 1-5"
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
    }
  }
}


/// API


# resource "google_cloud_scheduler_job" "job_morning_jomo" {
#   name        = "daily-task-morning-jomo"
#   description = "Tarea diaria para 8:55 AM de lunes a viernes API"

#   schedule  = "55 8 * * 1-5"
#   time_zone = "America/Santiago" # Ajusta según tu zona horaria

#   http_target {
#     uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/v2/execute"
#     http_method = "POST"
#     body = base64encode(jsonencode({
#       rut      = "137256762"
#       password = "5586"
#     }))
#     headers = {
#       "Content-Type" = "application/json"
#     }

#     # Configuración OIDC
#     oidc_token {
#       service_account_email = "chrisloarryn@gcp-course-2024.iam.gserviceaccount.com"
#     }
#   }
# }

# resource "google_cloud_scheduler_job" "job_afternoon_mon_thu_jomo" {
#   name        = "daily-task-afternoon-mon-thu-jomo"
#   description = "Tarea diaria para 19:04 de lunes a jueves API"

#   schedule  = "4 19 * * 1-4"
#   time_zone = "America/Santiago" # Ajusta según tu zona horaria

#   http_target {
#     uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/v2/execute"
#     http_method = "POST"
#     body = base64encode(jsonencode({
#       rut      = "137256762"
#       password = "5586"
#     }))
#     headers = {
#       "Content-Type" = "application/json"
#     }

#     # Configuración OIDC
#     oidc_token {
#       service_account_email = "chrisloarryn@gcp-course-2024.iam.gserviceaccount.com"
#     }
#   }
# }

# resource "google_cloud_scheduler_job" "job_friday_jomo" {
#   name        = "daily-task-friday-jomo"
#   description = "Tarea diaria para 16:47 el viernes API"

#   schedule  = "47 16 * * 5"
#   time_zone = "America/Santiago" # Ajusta según tu zona horaria

#   # max retry attempt

#   http_target {
#     uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/v2/execute"
#     http_method = "POST"
#     body = base64encode(jsonencode({
#       rut      = "137256762"
#       password = "5586"
#     }))
#     headers = {
#       "Content-Type" = "application/json"
#     }

#     # Configuración OIDC
#     oidc_token {
#       service_account_email = "chrisloarryn@gcp-course-2024.iam.gserviceaccount.com"
#     }
#   }
# }