# Certificate Manager Order Certificate Eample

This example illustrates how to  order a certifictae into the Certificate Manager service instance.


## Example Usage of Import Module

`Order Certificate`:

```hcl
module "order" {
  source                          = "terraform-ibm-modules/certificate-manager/ibm//modules/ibm-cms-order"
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

## Notes

1. It's assumed that user has valid domain ownership while ordering certificates using IBM CIS.
2. [ Certificate Ordering Limitations ](https://cloud.ibm.com/docs/certificate-manager?topic=certificate-manager-ordering-certificates#certificate-ordering-limitations)
3. Before ordering certificates using IBM CIS [ Set up ordering certificates using CIS ](https://cloud.ibm.com/docs/certificate-manager?topic=certificate-manager-ordering-certificates#cis)
4. [ Certificate Ordering Limits ](https://cloud.ibm.com/docs/certificate-manager?topic=certificate-manager-limits#api-limits)
5. [ API Documentation for CMS ](https://cloud.ibm.com/apidocs/certificate-manager)
6. Terraform IBM provider v1.4.0 (via Terraform 0.12) doesn't supports ordering certificates using `Other DNS provider`.
7. With `auto_renew_enabled`, certificates are automatically renewed 31 days before they expire. If your certificate expires in less than 31 days, you must renew it by updating `renew_certificate`. After you do so, your future certificates are renewed automatically.


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name                            | Description                               |Type    |Default           |Required|
|---------------------------------|-------------------------------------------|--------|------------------------|---|
| region                          | The region of the instance                |`string`| n/a                    |yes|
| service_intance_name            | The Name of the CMS Instance.             |`string`| n/a                    |yes|
| name                            | Name of ordering certificate.             |`string`| n/a                    |yes|
| description                     | Description of ordering certificate       |`string`| n/a                    |no |
| domain_names                    | Valid CIS domain                          |`string`| n/a                    |yes|
| domain_validation_method        | Domain Validation Method of the CIS Domain|`string`|`dns-01 `               |yes|
| cis_instance_crn                | The name of the CIS Instance resource.    |`string`| n/a                    |yes|
| key_algorithm                   | Key Algorithm                             |`string`|`rsaEncryption 2048 bit`|no |
| auto_renew_enabled              | Should be enabled for auto renewal        |`bool`  | false                  |no |
| renew_certificate               | Should be enabled for renewal.            |`string`| false                  |no |
| rekey_certificate               | Should be enabled for rotating keys       |`bool`  | false                  |no |

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