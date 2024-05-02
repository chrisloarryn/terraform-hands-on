resource "google_cloud_run_service" "cloud_run" {
  name     = "${var.cloud_run.cloud_run_name}-${var.cloud_run.environment_running}"
  location = var.cloud_run.location
  project  = var.cloud_run.project_id

  template {
    metadata {
      name = "${var.cloud_run.cloud_run_name}-${var.cloud_run.environment_running}-container"
      labels = {
        "cloud.googleapis.com/location" = var.cloud_run.location
        "cloud.googleapis.com/project"  = var.cloud_run.project_id
        # add more labels here
        "cloud.googleapis.com/developer" = "chrisloarryn"
      }
      namespace = "default"
      annotations = {
        "autoscaling.knative.dev/minScale" = var.cloud_run.min_instances
        "autoscaling.knative.dev/maxScale" = var.cloud_run.max_instances
        "run.googleapis.com/client-name"    = "terraform"
      }
    }
    spec {
      container_concurrency = 80
      containers {
        image = var.cloud_run.container_image
        ports {
          container_port = 3000
        }
        env {
          name  = "GOOGLE_CLIENT_ID"
          value = "236115999865-mk85b3e6t4saj3l5i6m5ebjc5q3sk6fp.apps.googleusercontent.com"
        }
        env {
          name  = "GOOGLE_CLIENT_SECRET"
          value = ""
        }
        env {
          name  = "GOOGLE_CALLBACK_URL"
          value = "http://localhost:3000/api/v1/auth/google/callback"
        }
        env {
          name  = "GOOGLE_CLOUD_JSON"
          value = var.cloud_run.google_cloud_json_b64
        }
        env {
          name  = "MONGO_DB_NAME"
          value = var.cloud_run.mongo_db_name
        }
        env {
          name  = "MONGO_DB_URI"
          value = var.cloud_run.mongo_db_uri
        }
        env {
          name  = "NODE_ENV"
          value = var.cloud_run.environment_running
        }
        env {
          name  = "LOG_LEVEL"
          value = "debug"
        }
        env {
          name  = "GLOBAL_PREFIX"
          value = "api"
        }
        env {
          name  = "REQUEST_TIMEOUT"
          value = "30000"
        }
        env {
          name  = "SWAGGER_NAME"
          value = "API"
        }
        env {
          name  = "SWAGGER_DESCRIPTION"
          value = "API"
        }
        env {
          name  = "SWAGGER_VERSION"
          value = "1.0"
        }
        env {
          name  = "SWAGGER_CONTACT_EMAIL"
          value = "amauil"
        }
        env {
          name  = "SWAGGER_CONTACT_NAME"
          value = "amauil"
        }
        env {
          name  = "SWAGGER_URL"
          value = "api-docs"
        }
        env {
          name  = "ESLINT_USE_FLAT_CONFIG"
          value = "true"
        }
        env {
          name  = "SRV_VALIDATIONS"
          value = "https://movil-app-ms-backend-dev-ekrxay4khq-uc.a.run.app"
        }
      }
    }
  }
  traffic {
    percent         = 100
    latest_revision = true
  }

  # autogenerate_revision_name = true
}


###### Cloud Run IAM Binding #######
resource "google_cloud_run_service_iam_binding" "binding"{
location = google_cloud_run_service.cloud_run.location
project  = google_cloud_run_service.cloud_run.project
service  = google_cloud_run_service.cloud_run.name
role     = var.cloud_run.cloud_run_role
members  = var.cloud_run.members
}
