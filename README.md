# IBM Certificate Manager Terraform Module

This is a collection of modules that make it easier to provision certificate Manager, Import and Order Certificates on IBM Cloud Platform:
* [ibm-cms-instance](./modules/ibm-cms-instance)
* [ibm-cms-import](./modules/ibm-cms-import)
* [ibm-cms-order](./modules/ibm-cms-order)
## Compatibility

This module is meant for use with Terraform 0.12.

## Usage

Full examples are in the [examples](./examples/) folder, but basic usage is as follows:

Provisioning instance:
``` hcl
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

```

Importing Certificate from a file:
```hcl
provider "ibm" {
}
data "ibm_resource_instance" "cms_instance" {
  name     = var.service_intance_name
  location = var.region
  service  = "cloudcerts"
}

module "import_from_file" {
  source                          = "../../../modules/ibm-cms-import"
  region                          = var.region
  certificate_manager_instance_id = data.ibm_resource_instance.cms_instance.id
  name                            = var.name
  description                     = var.description
  certificate_file                = file(var.certificate_file)
  priv_key_file                   = var.priv_key_file
  intermediate_certificate_file   = var.intermediate_certificate_file
}
```
Ordering Certificate

```hcl
provider "ibm" {
}
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
  source                          = "../../modules/ibm-cms-order"
  region                          = var.region
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
```
##  Certificate Manager Data Sources
`List all certificates:`

```hcl

data "ibm_certificate_manager_certificates" "certs"{
    certificate_manager_instance_id=data.ibm_resource_instance.cms_instance.id
}

```
`Get details of certificate:`

```hcl

data "ibm_certificate_manager_certificate" "certificate"{
    certificate_manager_instance_id=data.ibm_resource_instance.cms_instance.id
    name = "cert_name"
}

```
## Requirements

### Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) 0.12
- [terraform-provider-ibm](https://github.com/IBM-Cloud/terraform-provider-ibm) 

## Install

### Terraform

Be sure you have the correct Terraform version (0.12), you can choose the binary here:
- https://releases.hashicorp.com/terraform/

### Terraform plugins

Be sure you have the compiled plugins on $HOME/.terraform.d/plugins/

- [terraform-provider-ibm](https://github.com/IBM-Cloud/terraform-provider-ibm) 

## How to input varaible values through a file

To review the plan for the configuration defined (no resources actually provisioned)

`terraform plan -var-file=./input.tfvars`

To execute and start building the configuration defined in the plan (provisions resources)

`terraform apply -var-file=./input.tfvars`

To destroy the Database resources

`terraform destroy -var-file=./input.tfvars`

All optional parameters by default will be set to null in respective example's varaible.tf file. If user wants to configure any optional paramter he has overwrite the default value.

## Note

* All optional fields should be given value `null` in respective resource varaible.tf file. User can configure the same by overwriting with appropriate values.

* Notification Channel is not currently supported by the latest version of provider.

## References

[IBM-Cloud Certificate Manager docs](https://cloud.ibm.com/docs/certificate-manager?topic=certificate-manager-getting-started)
