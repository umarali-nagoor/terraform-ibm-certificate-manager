############################################################################
# IBM Cloud certificate manager Provisioning, Import and order Certificates
# Copyright 2020 IBM
############################################################################

variable "service_intance_name" {
  type        = string
  description = "CMS Service instance Name"
}
variable "name" {
  type        = string
  description = "Name of certificate that has to be orderd."
}
variable "description" {
  type        = string
  description = "Description of certificate that has to be orderd"
  default     = null

}
variable "domain_names" {
  type        = list
  default     = null
  description = "CIS Domain names"
}
variable "domain_validation_method" {
  type        = string
  description = "Domain Validation Method of the CIS Domain"
  default     = null

}
variable "cis_instance_name" {
  type        = string
  description = "CIS Service instance Name"
}
variable "key_algorithm" {
  type        = string
  description = "Key Algorithm"
  default     = null
}
variable "automatic_certificate_renewal" {
  type        = bool
  description = "Indicates if certificates has to be automatically renewed"
  default     = null
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
variable "region" {
  type        = string
  description = "Region in which certificate has to be provisioned"
}