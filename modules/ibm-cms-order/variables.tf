############################################################################
# IBM Cloud certificate manager Provisioning, Import and order Certificates
# Copyright 2020 IBM
############################################################################

variable "certificate_manager_instance_id" {
  type        = string
  description = "CMS Service instance ID"
}
variable "name" {
  type        = string
  description = "Name of certificate that has to be orderd."
}
variable "description" {
  type        = string
  default     = null
  description = "Description of certificate that has to be orderd"
}
variable "domain_names" {
  type        = list
  description = "CIS Domain name"
}
variable "domain_validation_method" {
  type        = string
  default     = null
  description = "Domain Validation Method of the CIS Domain"
}
variable "cis_instance_crn" {
  type        = string
  description = "CIS Service instance ID"
}
variable "key_algorithm" {
  type        = string
  default     = null
  description = "Key Algorithm"
}
variable "automatic_certificate_renewal" {
  type        = bool
  default     = null
  description = "Indicates if certificates has to be automatically renewed"
}
variable "renew_certificate" {
  type        = bool
  default     = null
  description = "Indicates if certificates has to be renewed"
}
variable "rekey_certificate" {
  type        = bool
  default     = null
  description = "Rotate Keys"
}
