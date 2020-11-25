############################################################################
# IBM Cloud certificate manager Provisioning, Import and order Certificates
# Copyright 2020 IBM
############################################################################

resource "ibm_resource_instance" "cms_instance" {
  name              = var.service_name
  service           = "cloudcerts"
  plan              = var.plan
  location          = var.region
  resource_group_id = var.resource_group_id
  tags              = (var.tags != null ? var.tags : null)
  service_endpoints = (var.service_endpoints != null ? var.service_endpoints : null)
  parameters        = (var.parameters != null ? var.parameters : null)
}
