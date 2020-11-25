############################################################################
# IBM Cloud certificate manager Provisioning, Import and order Certificates
# Copyright 2020 IBM
############################################################################

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
variable "certificate_file" {
  type        = string
  description = "Certificate File Path"
}
variable "priv_key_file" {
  type        = string
  description = "Certificate Private Key"
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
