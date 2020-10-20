############################################################################
# IBM Cloud certificate manager Provisioning, Import and order Certificates
# Copyright 2020 IBM
############################################################################

resource "ibm_certificate_manager_order" "order_certificate" {
  certificate_manager_instance_id = var.certificate_manager_instance_id
  name                            = var.name
  description                     = (var.description != null ? var.description : null)
  domains                         = var.domain_names
  domain_validation_method        = (var.domain_validation_method != null ? var.domain_validation_method : "dns-01")
  dns_provider_instance_crn       = var.cis_instance_crn
  key_algorithm                   = (var.key_algorithm != null ? var.key_algorithm : null)
  auto_renew_enabled              = (var.automatic_certificate_renewal != null ? var.automatic_certificate_renewal : false)
  renew_certificate               = (var.renew_certificate != null ? var.renew_certificate : false)
  rotate_keys                     = (var.rekey_certificate != null ? var.rekey_certificate : false)
}