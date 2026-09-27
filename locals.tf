locals {
  common_tags = merge(var.tags, {
    Module = "terraform-aws-vpc"
  })
}
