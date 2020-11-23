############################################################################
# IBM Cloud certificate manager Provisioning, Import and order Certificates
# Copyright 2020 IBM
############################################################################

data "ibm_resource_instance" "cms_instance" {
  name     = var.service_intance_name
  location = var.region
  service  = "cloudcerts"
}
//Getting existing CIS resource
data "ibm_cis" "cis_instance" {
  name = var.cis_instance_name
}
module "order" {
  source                          = "terraform-ibm-modules/certificate-manager/ibm//modules/ibm-cms-order"
  certificate_manager_instance_id = data.ibm_resource_instance.cms_instance.id
  name                            = var.name
  description                     = var.description
  domain_names                    = var.domain_names
  domain_validation_method        = var.domain_validation_method
  cis_instance_crn                = data.ibm_cis.cis_instance.id
  key_algorithm                   = var.key_algorithm
  automatic_certificate_renewal   = var.automatic_certificate_renewal
  renew_certificate               = var.renew_certificate
  rekey_certificate               = var.rekey_certificate
}