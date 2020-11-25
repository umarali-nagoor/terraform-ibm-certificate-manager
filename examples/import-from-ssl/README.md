# Example for Certificate Manager Import Certificate

This example illustrates how to  import a certifictae into the Certificate Manager service instance.

Certificates can be imported in different ways. Below is the example to import a certificate using ssl.

## Example Usage of Import Module

`Create ssl certificates using null resource and Import Certificates`:
```hcl

module "certificate-manager_import-from-ssl" {
  source                          = "terraform-ibm-modules/certificate-manager/ibm//modules/import"
  region                          = var.region
  certificate_manager_instance_id = data.ibm_resource_instance.cms_instance.id
  name                            = var.name
  description                     = var.description
  certificate_file                = data.local_file.cert.content
  priv_key_file                   = data.local_file.key.content
  intermediate_certificate_file   = var.intermediate_certificate_file
}

```

## NOTE: If we want to make use of a particular version of module, then set the "version" argument to respective module version.


* [ API Documentation for CMS ](https://cloud.ibm.com/apidocs/certificate-manager)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name                            | Description                                         | Type   |Default|Required|
|---------------------------------|-----------------------------------------------------|--------|-------|----------|
| region                          | THe region where the resource has to be provisioned.|`string`| n/a   | yes      |
| service\_intance\__name         | The Id of the Certificate Manager Service Instance. |`string`| n/a   | yes      |
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
$ terraform plan
$ terraform apply 
```

Run `terraform destroy ` when you don't need these resources.

 ## Note:
 * All optional fields are given value `null` in varaible.tf file. User can configure the same by overwriting with appropriate values.
 * Necessary SSL configuration must be made before using this example.. if not it considers default values..