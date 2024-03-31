# Variables


variable "type" {
  description = "The type of the service account key"
  type        = string
  default     = "service_account"
}

variable "region" {
  description = "The region where the service account key will be created"
  type        = string
  default     = "southamerica-west1"
}
#
variable "mongo_db_name" {
  description = "The name of the MongoDB database"
  type        = string
}


variable "environment" {
  description = "The environment"
  type        = string
}

variable "google_cloud_json_b64" {
  description = "The base64 encoded Google Cloud JSON"
  type        = string
  sensitive   = true
}

variable "mongo_db_uri" {
  description = "The name of the MongoDB URI"
  type        = string
  sensitive   = true
}

variable "project_id" {
  description = "The project ID"
  type        = string
  sensitive   = false
}

variable "private_key_id" {
  description = "The private key ID"
  type        = string
  sensitive   = false
}

variable "private_key" {
  description = "The private key"
  type        = string
  sensitive   = true
}

variable "client_email" {
  description = "The client email"
  type        = string
  sensitive   = false
}

variable "client_id" {
  description = "The client ID"
  type        = string
  sensitive   = false
}

variable "auth_uri" {
  description = "The auth URI"
  type        = string
  sensitive   = false
}

variable "token_uri" {
  description = "The token URI"
  type        = string
  sensitive   = false
}

// artifact_repository_id
variable "artifact_repository_id" {
  description = "The auth provider x509 cert URL"
  type        = string
  sensitive   = false
}

variable "auth_provider_x509_cert_url" {
  description = "The auth provider x509 cert URL"
  type        = string
  sensitive   = false
}

variable "client_x509_cert_url" {
  description = "The client x509 cert URL"
  type        = string
  sensitive   = false
}

variable "universe_domain" {
  description = "The universe domain"
  type        = string
  sensitive   = false
}
