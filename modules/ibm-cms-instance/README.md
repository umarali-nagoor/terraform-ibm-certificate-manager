# Module certificate manager instance

This module is used to create a certificate manager instance.

## Example Usage
```
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
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name                | Description                                                    | Type   |Default  |Required |
|---------------------|----------------------------------------------------------------|:-------|:--------|:--------|
| service_name        | A descriptive name used to identify the resource instance      |`string`| n/a     | yes     |
| plan                | The name of the plan type supported by service.                |`string`| n/a     | yes     |
| region              | Target location or environment to create the resource instance |`string`| n/a     | yes     |
| resource\_group\_id | ID of the resource group                                       |`string`| n/a     | yes     |
| tags                | Tags for the database                                          |`set`   | n/a     | no      |
| service_endpoints   | Types of the service endpoints.                                |`string`| n/a     | no      |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan -var-file = "input.tfvars"
$ terraform apply -var-file = "input.tfvars"
```

Run `terraform destroy -var-file="input.tfvars"` when you don't need these resources.

 ## Note:
 All optional fields are given value `null` in varaible.tf file. User can configure the same by overwriting with appropriate values.