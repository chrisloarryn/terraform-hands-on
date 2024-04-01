resource "google_compute_instance" "vm_instance" {
  name         = var.compute_engine.name
  project      = var.compute_engine.project_id
  zone         = var.compute_engine.zone
  machine_type = var.compute_engine.machine_type
  description = var.compute_engine.description

  boot_disk {
    initialize_params {
      image = var.compute_engine.image
    }
  }

  network_interface {
    network = var.compute_engine.network_interface.network
    subnetwork = var.compute_engine.network_interface.subnetwork
    // Asegúrate de configurar cualquier ajuste de red adicional aquí, si es necesario.
  }

  // Configuración de metadatos y etiquetas, ajusta según tus necesidades.
  metadata = {
    foo = "bar" // Ejemplo, reemplaza con tus metadatos reales.
    // Añade más pares clave-valor según sea necesario.
  }

  tags = ["web", "production"] // Ajusta las etiquetas según tus necesidades.
}
