# terraform-aws-vpc

This module creates a VPC with public and private subnet pairs across the availability zones defined by the caller. Public subnets route to an internet gateway. Private subnets route through an availability-zone-local NAT gateway.

An S3 gateway VPC endpoint is associated with every route table, so S3 API traffic doesn't traverse public internet.

## Usage

```hcl
module "vpc" {
	source = "github.com/benkorichard/terraform-aws-vpc"

    vpc_cidr = "10.0.0.0/16"
	name     = "vpc-01"

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
