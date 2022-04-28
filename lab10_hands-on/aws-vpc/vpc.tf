############################################# LUCAS OMENA #############################################

# HANDS-ON LABS
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

#######################################################################################################

// VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = {
    "Name"        = join("-", [var.prefix, join("", ["vpc", format("%02d", var.sequence), var.environment])])
    "Environment" = "${local.environment}"
  }

  lifecycle {
    prevent_destroy = true
  }
}

