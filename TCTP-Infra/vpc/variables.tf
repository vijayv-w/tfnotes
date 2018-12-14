
variable "environment" {
  type        = "string"
  default     = "CTP-DEV"
  description = "Environment, e.g. 'prod', 'staging', 'dev', 'UAT'"
}

variable "tag_name" {
  type        = "string"
  default     = "CTP-DEV"
  description = "Tag Name, e.g. 'prod', 'staging', 'dev', 'UAT'"
}

variable "costcenter" {
  type        = "string"
  default     = "1000"
  description = "Cost Center for the resource"
}

variable "hostingprovider" {
  type        = "string"
  default     = "AWS"
  description = "Hosting Provider"
}
