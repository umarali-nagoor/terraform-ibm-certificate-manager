# Certificate Manager Order Module

This example illustrates how to  order a certifictae into the Certificate Manager service instance.


## Example Usage of Import Module

`Order Certificate`:

```hcl
resource "ibm_certificate_manager_order" "order_certificate" {
  certificate_manager_instance_id = var.certificate_manager_instance_id
  name                            = var.name
  description                     = (var.description != null ? var.description : null)
  domains                         = var.domain_names
  domain_validation_method        = (var.domain_validation_method != null ? var.domain_validation_method : "dns-01")
  dns_provider_instance_crn       = var.cis_instance_crn
  key_algorithm                   = (var.key_algorithm != null ? var.key_algorithm : null)
  auto_renew_enabled              = (var.automatic_certificate_renewal != null ? var.automatic_certificate_renewal : false)
  renew_certificate               = (var.renew_certificate != null ? var.renew_certificate : false)
  rotate_keys                     = (var.rekey_certificate != null ? var.rekey_certificate : false)
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
| certificate_manager_instance_id | The Id of the CMS Instance.               |`string`| n/a                    |yes|
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