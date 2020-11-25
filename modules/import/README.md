# Certificate Manager Import Module

This example illustrates how to  import a certifictae into the Certificate Manager service instance.


## Example Usage of Import Module

`Import Certificate`:

```hcl

module "certificate-manager_import-from-file" {
  source                          = "terraform-ibm-modules/certificate-manager/ibm//modules/import"
  certificate_manager_instance_id = data.ibm_resource_instance.cms_instance.id
  name                            = var.name
  description                     = var.description
  certificate_file                = file(var.certificate_file)
  priv_key_file                   = var.priv_key_file
  intermediate_certificate_file   = var.intermediate_certificate_file
}

```

## Notes

* [ API Documentation for CMS ](https://cloud.ibm.com/apidocs/certificate-manager)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name                            | Description                                         | Type   |Default|Required|
|---------------------------------|-----------------------------------------------------|--------|-------|----------|
| service\_intance\_id            | The Id of the Certificate Manager Service Instance. |`string`| n/a   | yes      |
| name                            | Name of certificate that has to be imported.        |`string`| n/a   | yes      |
| description                     | Description of certificate that has to be imported  |`string`| n/a   | no       |
| certificate\_file               | Content of certificate                              |`string`| n/a   | yes      |
| intermediate\_certificate\_file | Certificate Intermediate.                           |`string`| n/a   | no       |
| priv\_key\_file                 | Certificate Private Key                             |`string`| n/a   | no       |

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