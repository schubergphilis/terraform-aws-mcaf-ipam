variable "aws_ipam_pool" {
  type        = list(string)
  description = "The top level CIDR(s) available for usage on AWS"
}

variable "ipam_description" {
  type        = string
  description = "A description for the IPAM"
  default     = "Organization IPAM"
}

variable "pools" {
  type = map(object({
    cidr             = list(string)
    shared_principal = optional(list(string))
    tags             = optional(map(string))
  }))
}

variable "tags" {
  type        = map(string)
  description = "Map of tags to set on Terraform created resources"
  default     = {}
}
