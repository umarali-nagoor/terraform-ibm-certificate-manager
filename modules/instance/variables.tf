############################################################################
# IBM Cloud certificate manager Provisioning, Import and order Certificates
# Copyright 2020 IBM
############################################################################

variable "resource_group_id" {
  type        = string
  description = "Resource Group ID"
}
variable "service_name" {
  type        = string
  description = "Resource instance name for example, my cms instance"
}
variable "plan" {
  type        = string
  description = "The plan type of the cms instance"
}
variable "region" {
  type        = string
  description = "The location or the region in which cms instance exists"
}
variable "service_endpoints" {
  default     = null
  type        = string
  description = "Types of the service endpoints. Possible values are 'public', 'private', 'public-and-private'."
}
variable "parameters" {
  default     = null
  type        = map
  description = "Additional parameters to create reesource instance"
}

variable "tags" {
  default     = null
  type        = set(string)
  description = "Tags for the cms"
}
