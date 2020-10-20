############################################################################
# IBM Cloud certificate manager Provisioning, Import and order Certificates
# Copyright 2020 IBM
############################################################################

variable "service_intance_name" {
  type        = string
  description = "Certificate Instance name"
}
variable "ssl_key" {
  type        = string
  description = "Private Key file name of SSL certificate."
  default     = "private_key.key"
}
variable "ssl_cert" {
  type        = string
  description = "SSL Certificate file name"
  default     = "certificate.pem"
}
variable "ssl_country" {
  type        = string
  description = "SSL Country"
  default     = "us"
}
variable "ssl_state" {
  type        = string
  description = "SSL State"
  default     = "us-south"
}
variable "ssl_location" {
  type        = string
  description = "SSL Country"
  default     = "Dal-10"
}
variable "ssl_org" {
  type        = string
  description = "SSL Org"
  default     = "IBM"
}
variable "ssl_ou" {
  type        = string
  description = "SSL OU"
  default     = "CloudCerts"
}
variable "host" {
  type        = string
  description = "SSL Host"
  default     = "ibm.com"
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