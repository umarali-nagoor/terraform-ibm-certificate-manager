############################################################################
# IBM Cloud certificate manager Provisioning, Import and order Certificates
# Copyright 2020 IBM
############################################################################

variable "certificate_manager_instance_id" {
  type        = string
  description = "Certificate Manager Instance ID"
}
variable "name" {
  type        = string
  description = "Certificate Name that is being imported"
}
variable "description" {
  type        = string
  default     = null
  description = "Certificate Description"
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
  default     = null
  description = "Certificate Intermediate"
}
