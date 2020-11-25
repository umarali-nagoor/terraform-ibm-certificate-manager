############################################################################
# IBM Cloud certificate manager Provisioning, Import and order Certificates
# Copyright 2020 IBM
############################################################################

resource "ibm_certificate_manager_import" "import_certificate" {
  certificate_manager_instance_id = var.certificate_manager_instance_id
  name                            = var.name
  description                     = (var.description != null ? var.description : null)
  data = {
    content      = var.certificate_file
    priv_key     = (var.priv_key_file != null ? var.priv_key_file : null)
    intermediate = (var.intermediate_certificate_file != null ? var.intermediate_certificate_file : null)
  }
}


