# Variables
variable "region" {
  description = "The region where the service account key will be created"
  type        = string
  default     = "southamerica-west1"
}

variable "environment" {
  description = "The environment"
  type        = string
}

variable "project_id" {
  description = "The project ID"
  type        = string
  sensitive   = false
}

variable "path_to_credentials" {
  description = "The path to the service account key"
  type        = string
}

# variable "compute_engine" {
#   description = "The compute engine configuration"


# }