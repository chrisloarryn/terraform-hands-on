provider "google" {
  credentials = jsonencode({
    type                        = var.type
    project_id                  = var.project_id
    private_key_id              = var.private_key_id
    private_key                 = var.private_key
    client_email                = var.client_email
    client_id                   = var.client_id
    auth_uri                    = var.auth_uri
    token_uri                   = var.token_uri
    auth_provider_x509_cert_url = var.auth_provider_x509_cert_url
    client_x509_cert_url        = var.client_x509_cert_url
  })
  project = var.project_id
  region  = var.region
}
