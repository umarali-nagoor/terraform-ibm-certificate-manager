############################################################################
# IBM Cloud certificate manager Provisioning, Import and order Certificates
# Copyright 2020 IBM
############################################################################

output "order_certificate" {
  value = ibm_certificate_manager_order.order_certificate
}
