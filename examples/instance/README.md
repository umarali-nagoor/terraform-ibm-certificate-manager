# certificate manager instance Example

This example is used to create a certificate manager instance.

## Example Usage
```
module "certificate-manager_instance" {
  source = "terraform-ibm-modules/certificate-manager/ibm//modules/instance"

  resource_group_id = data.ibm_resource_group.resource_group.id
  service_name      = var.service_name
  region            = var.region
  plan              = var.plan
  tags              = var.tags
  service_endpoints = var.service_endpoints
  parameters        = var.parameters
}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name                | Description                                                    | Type   |Default  |Required |
|---------------------|----------------------------------------------------------------|:-------|:--------|:--------|
| service_name        | A descriptive name used to identify the resource instance      |`string`| n/a     | yes     |
| plan                | The name of the plan type supported by service.                |`string`| n/a     | yes     |
| region              | Target location or environment to create the resource instance |`string`| n/a     | yes     |
| resource\_group_name| Name of the resource group                                     |`string`| n/a     | yes     |
| tags                | Tags for the database                                          |`set`   | n/a     | no      |
| service_endpoints   | Types of the service endpoints.                                |`string`| n/a     | no      |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## NOTE: If we want to make use of a particular version of module, then set the "version" argument to respective module version.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan 
$ terraform apply
```

Run `terraform destroy ` when you don't need these resources.

 ## Note:
 All optional fields are given value `null` in varaible.tf file. User can configure the same by overwriting with appropriate values.