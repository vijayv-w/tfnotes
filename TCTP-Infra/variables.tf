variable "aws_profile" {
     default = ""
}

variable "aws_role_arn" {
     default = ""
}

variable "aws_region" {
  description = "EC2 region for the VPC."
}

variable "vpc_cidr" {}


variable "aws_azs" {
  description = "AWS availability zones by region."
}

// TODO: NOTE Right now environment & tag_name is same.
// Just use tag_name for now and just with this we might be 
// able to handle all diff environments
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

// TODO: Put correct cost center here
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

