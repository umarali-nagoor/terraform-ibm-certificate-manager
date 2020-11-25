############################################################################
# IBM Cloud certificate manager Provisioning, Import and order Certificates
# Copyright 2020 IBM
############################################################################

variable ca_cert_validity_period_days {
  type        = number
  default     = 3660
  description = "ca certificate validity, in days"
}

variable ca_cert_early_renewal_days {
  type        = number
  default     = 180
  description = "ca early certificate renewal, in days"
}
variable "dns_names" {
  type        = list
  description = "TLS Description Names"
  default     = ["example.com"]
}
variable "common_name" {
  type        = string
  description = "TLS Subject Common Name"
  default     = "example.com"
}
variable "organization" {
  type        = string
  description = "TLS Subject organization"
  default     = "Example"
}
variable "service_intance_name" {
  type        = string
  description = "Certificate Instance name"
}
variable "name" {
  type        = string
  description = "Certificate Name that is being imported"
}
variable "description" {
  type        = string
  description = "Certificate Description"
  default     = null
}
variable "intermediate_certificate_file" {
  type        = string
  description = "Certificate Intermediate"
  default     = null
}
variable "region" {
  type        = string
  description = "Region in which certificate has to be provisioned"
}
variable "resource_group_name" {
  type = string
  description ="Name of the resource group on which service instance is present or has to be provisioned"
}
