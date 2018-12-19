variable "tag_name" {
}

variable "subnet_ids" {
  description = "List of subnet ids associated with this Lambda function"
  type        = "list"
  default     = []
}

variable "security_group_ids" {
  description = "List of security groups associated with this Lambda function"
  type        = "list"
  default     = []
}
