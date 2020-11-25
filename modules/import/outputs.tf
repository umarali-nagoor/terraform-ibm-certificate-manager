############################################################################
# IBM Cloud certificate manager Provisioning, Import and order Certificates
# Copyright 2020 IBM
############################################################################

output "import_certificate" {
  value = ibm_certificate_manager_import.import_certificate
}
