############################################################################
# IBM Cloud certificate manager Provisioning, Import and order Certificates
# Copyright 2020 IBM
############################################################################

data "ibm_resource_group" "resource_group" {
  name = var.resource_group_name
}

module "ibm-cms-instance" {
  source = "../../modules/ibm-cms-instance"

  resource_group_id = data.ibm_resource_group.resource_group.id
  service_name      = var.service_name
  region            = var.region
  plan              = var.plan
  tags              = var.tags
  service_endpoints = var.service_endpoints
  parameters        = var.parameters
}

