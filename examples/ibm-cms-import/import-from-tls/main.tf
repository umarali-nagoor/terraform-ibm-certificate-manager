############################################################################
# IBM Cloud certificate manager Provisioning, Import and order Certificates
# Copyright 2020 IBM
############################################################################

provider "tls" {}

resource "tls_private_key" "ca" {
  algorithm = "RSA"
}

resource "tls_self_signed_cert" "ca" {
  key_algorithm         = "RSA"
  private_key_pem       = tls_private_key.ca.private_key_pem
  validity_period_hours = var.ca_cert_validity_period_days
  early_renewal_hours   = var.ca_cert_early_renewal_days
  is_ca_certificate     = true

  allowed_uses = ["digital_signature", "cert_signing", "key_encipherment"]

  dns_names = var.dns_names

  subject {
    common_name  = var.common_name
    organization = var.organization
  }
}

data "ibm_resource_instance" "cms_instance" {
  name     = var.service_intance_name
  location = var.region
  service  = "cloudcerts"
}

module "import_from_tls" {
  source                          = "terraform-ibm-modules/certificate-manager/ibm//modules/ibm-cms-import"
  certificate_manager_instance_id = data.ibm_resource_instance.cms_instance.id
  name                            = var.name
  description                     = var.description
  certificate_file                = tls_self_signed_cert.ca.cert_pem
  priv_key_file                   = tls_private_key.ca.private_key_pem
  intermediate_certificate_file   = var.intermediate_certificate_file
}
