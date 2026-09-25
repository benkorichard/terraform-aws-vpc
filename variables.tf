variable "name" {
  description = "Name prefix for the VPC resources."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets."
  type        = map(string)

  validation {
    condition     = length(var.public_subnet_cidrs) > 0
    error_message = "public_subnet_cidrs must contain at least one availability zone."
  }
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the private subnets."
  type        = map(string)

  validation {
    condition     = length(setsubtract(keys(var.private_subnet_cidrs), keys(var.public_subnet_cidrs))) == 0 && length(setsubtract(keys(var.public_subnet_cidrs), keys(var.private_subnet_cidrs))) == 0
    error_message = "public_subnet_cidrs and private_subnet_cidrs must use the same availability zone keys."
  }
}

variable "tags" {
  description = "Additional tags applied to all resources."
  type        = map(string)
  default     = {}
}
