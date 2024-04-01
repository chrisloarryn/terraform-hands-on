variable "compute_engine" {
  description = "Configuración de la Compute Engine"
  type = object({
    name              = string
    description       = string
    project_id        = string
    credentials       = object({
      path_to_credentials = string
    })
    zone              = string
    machine_type      = string
    image             = string
    network_interface = object({
      network    = string
      subnetwork = string
    })
  })
}
