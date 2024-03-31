variable "cloud_run" {
type = object({
cloud_run_name             = string
  project_id                    = string
location                   = string
cloud_run_role             = string
service_account_name       = string
cloud_run_role             = string
members                    = list(string)
min_instances              = optional(string)
max_instances              = optional(string)
container_image            = optional(string, "nginx:latest")
container_port             = optional(number, 3000)
  google_cloud_json_b64      = optional(string)
  mongo_db_uri               = optional(string)
    mongo_db_name              = optional(string)
  environment_running      = optional(string)
})
}
