# terraform-aws-vpc

This module creates a VPC with public and private subnet pairs across the availability zones defined by the caller. Public subnets route to an internet gateway. Private subnets route through an availability-zone-local NAT gateway.

An S3 gateway VPC endpoint is associated with all route tables, so S3 API traffic uses the AWS backbone and does not require NAT or an internet gateway.

## Usage

```hcl
provider "aws" {
  region = "eu-central-1"
}

module "vpc" {
	source = "git::https://github.com/benkorichard/terraform-aws-vpc?ref=v0.1.0"

    vpc_cidr = "10.0.0.0/16"
	name     = "application"

	public_subnet_cidrs = {
		"eu-central-1a" = "10.0.1.0/24"
		"eu-central-1b" = "10.0.2.0/24"
	}
	private_subnet_cidrs = {
		"eu-central-1a" = "10.0.11.0/24"
		"eu-central-1b" = "10.0.12.0/24"
	}
}
```
