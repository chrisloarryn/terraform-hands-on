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
}



/// SCHEDULER JOBS *-api
# resource "google_cloud_scheduler_job" "job_morning_api" {
#   name        = "daily-task-morning-api"
#   description = "Tarea diaria para 8:55 AM de lunes a viernes API"

#   schedule  = "55 8 * * 1-5"
#   time_zone = "America/Santiago" # Ajusta según tu zona horaria

#   http_target {
#     uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/v2/execute"
#     http_method = "POST"
#     body = base64encode(jsonencode({
#       rut      = "192935423"
#       password = "9761"
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

# resource "google_cloud_scheduler_job" "job_afternoon_mon_thu_api" {
#   name        = "daily-task-afternoon-mon-thu-api"
#   description = "Tarea diaria para 19:04 de lunes a jueves API"

#   schedule  = "4 19 * * 1-4"
#   time_zone = "America/Santiago" # Ajusta según tu zona horaria

#   http_target {
#     uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/v2/execute"
#     http_method = "POST"
#     body = base64encode(jsonencode({
#       rut      = "192935423"
#       password = "9761"
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

# resource "google_cloud_scheduler_job" "job_friday_api" {
#   name        = "daily-task-friday-api"
#   description = "Tarea diaria para 16:47 el viernes API"

#   schedule  = "47 16 * * 5"
#   time_zone = "America/Santiago" # Ajusta según tu zona horaria

#   # max retry attempt

#   http_target {
#     uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/v2/execute"
#     http_method = "POST"
#     body = base64encode(jsonencode({
#       rut      = "192935423"
#       password = "9761"
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

# # other markers at: 13:30 and at 14:15
# # job at 13:30
# resource "google_cloud_scheduler_job" "job_13_30_api" {
#   name        = "daily-task-13-30-api"
#   description = "Tarea diaria para 13:30 API"

#   schedule  = "30 13 * * 1-5"
#   time_zone = "America/Santiago" # Ajusta según tu zona horaria

#   http_target {
#     uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/v2/execute"
#     http_method = "POST"
#     body = base64encode(jsonencode({
#       rut      = "192935423"
#       password = "9761"
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

# # job at 14:15
# resource "google_cloud_scheduler_job" "job_14_15_api" {
#   name        = "daily-task-14-15-api"
#   description = "Tarea diaria para 14:15 API"

#   schedule  = "15 14 * * 1-5"
#   time_zone = "America/Santiago" # Ajusta según tu zona horaria

#   http_target {
#     uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/v2/execute"
#     http_method = "POST"
#     body = base64encode(jsonencode({
#       rut      = "192935423"
#       password = "9761"
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


# resource "google_cloud_scheduler_job" "job_morning_api" {
#   name        = "daily-task-morning-api"
#   description = "Tarea diaria para 8:55 AM de lunes a viernes API"

#   schedule  = "55 8 * * 1-5"
#   time_zone = "America/Santiago" # Ajusta según tu zona horaria

#   http_target {
#     uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/v2/execute"
#     http_method = "POST"
#     body = base64encode(jsonencode({
#       rut      = "192935423"
#       password = "9761"
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

# resource "google_cloud_scheduler_job" "job_afternoon_mon_thu_api" {
#   name        = "daily-task-afternoon-mon-thu-api"
#   description = "Tarea diaria para 19:04 de lunes a jueves API"

#   schedule  = "4 19 * * 1-4"
#   time_zone = "America/Santiago" # Ajusta según tu zona horaria

#   http_target {
#     uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/v2/execute"
#     http_method = "POST"
#     body = base64encode(jsonencode({
#       rut      = "192935423"
#       password = "9761"
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

# resource "google_cloud_scheduler_job" "job_friday_api" {
#   name        = "daily-task-friday-api"
#   description = "Tarea diaria para 16:47 el viernes API"

#   schedule  = "47 16 * * 5"
#   time_zone = "America/Santiago" # Ajusta según tu zona horaria

#   # max retry attempt

#   http_target {
#     uri         = "https://movil-app-backendo-dev-ey2qb5zbbq-tl.a.run.app/v2/execute"
#     http_method = "POST"
#     body = base64encode(jsonencode({
#       rut      = "192935423"
#       password = "9761"
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