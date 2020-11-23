# Example for Certificate Manager Import Certificate

This example illustrates how to  import a certifictae into the Certificate Manager service instance.

Certificates can be imported in different ways. Brlow are three different ways to import  certifcate on to cms instance

* [ Import From File ](./import-from-file)
* [ Import From SSL ](./import-from-ssl)
* [ Import From TLS ](./import-from-tls)

## Example Usage of Import Module

`Import existing Certificate`:

```hcl
module "import_from_file" {
  source                          = "terraform-ibm-modules/certificate-manager/ibm//modules/ibm-cms-import"
  certificate_manager_instance_id = data.ibm_resource_instance.cms_instance.id
  name                            = var.name
  description                     = var.description
  certificate_file                = file(var.certificate_file)
  priv_key_file                   = var.priv_key_file
  intermediate_certificate_file   = var.intermediate_certificate_file
}
```

`Create ssl certificates using null resource and Import Certificates`:
```hcl

module "import_from_ssl" {
  source                          = "terraform-ibm-modules/certificate-manager/ibm//modules/ibm-cms-import"
  region                          = var.region
  certificate_manager_instance_id = data.ibm_resource_instance.cms_instance.id
  name                            = var.name
  description                     = var.description
  certificate_file                = data.local_file.cert.content
  priv_key_file                   = data.local_file.key.content
  intermediate_certificate_file   = var.intermediate_certificate_file
}

```
`Create ssl certificates using tls resource and Import Certificates`:
```hcl

module "import_from_tls" {
  source                          = "terraform-ibm-modules/certificate-manager/ibm//modules/ibm-cms-import"
  region                          = var.region
  certificate_manager_instance_id = data.ibm_resource_instance.cms_instance.id
  name                            = var.name
  description                     = var.description
  certificate_file                = tls_self_signed_cert.ca.cert_pem
  priv_key_file                   = tls_private_key.ca.private_key_pem
  intermediate_certificate_file   = var.intermediate_certificate_file
}

```
## Notes

* Certificates generated using `tls_private_key` and `tls_self_signed_cert` [tls resources](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/self_signed_cert) can also be imported using `ibm_certificate_manager_import` resource.

* All the variables for `tls resource` and `ssl null resource` are given default values. It has to be overrided accordingly when it is used.

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
$ terraform plan -var-file = "input.tfvars"
$ terraform apply -var-file = "input.tfvars"
```

Run `terraform destroy -var-file="input.tfvars"` when you don't need these resources.

 ## Note:
 All optional fields are given value `null` in varaible.tf file. User can configure the same by overwriting with appropriate values.