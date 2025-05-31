# Variables
variable "region" {
  description = "The region where the service account key will be created"
  type        = string
  default     = "southamerica-west1"
}

variable "zone" {
  description = "The zone where the service account key will be created"
  type        = string
  default     = "southamerica-west1-a"
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

variable "users" {
  description = "Mapa de sufijos → credenciales («» para el job genérico)."
  type = map(object({
    rut      = string
    password = string
  }))

  default = {
    "-cris"        = { rut = "189795696", password = "5862" }   # sin sufijo
    "-jomo"   = { rut = "137256762", password = "5586" }
    "-frapac" = { rut = "138406253", password = "2435" }
  }
}

variable "base_jobs" {
  description = "Tipos de tarea → cron + descripción."
  type = map(object({
    name_prefix = string
    schedule    = string
    description = string
  }))

  default = {
    morning = {
      name_prefix = "daily-task-morning"
      schedule    = "55 8 * * 1-5"
      description = "Tarea diaria para 8:55 AM de lunes a viernes"
    }
    afternoon_mon_thu = {
      name_prefix = "daily-task-afternoon-mon-thu"
      schedule    = "4 19 * * 1-4"
      description = "Tarea diaria para 19:04 de lunes a jueves"
    }
    friday = {
      name_prefix = "daily-task-friday"
      schedule    = "47 16 * * 5"
      description = "Tarea diaria para 16:47 el viernes"
    }
    job_13_30 = {
      name_prefix = "daily-task-13-30"
      schedule    = "30 13 * * 1-5"
      description = "Tarea diaria para 13:30"
    }
    job_14_15 = {
      name_prefix = "daily-task-14-15"
      schedule    = "15 14 * * 1-5"
      description = "Tarea diaria para 14:15"
    }
  }
}
