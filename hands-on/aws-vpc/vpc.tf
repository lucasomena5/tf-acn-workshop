############################################# LUCAS OMENA #############################################

# HANDS-ON LABS
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

#######################################################################################################

// LOCAL VARIABLES
locals {
  environments = {
    "dev"     = "DEV"
    "pre"     = "PRE"
    "pro"     = "PRD"
    "network" = "NETWORK"
    "shared"  = "SHAREDSERVICES"
  }

  range_public_subnet           = range(0, sum([0, var.qtd_public_subnet]))
  range_private_subnet          = range(50, sum([50, var.qtd_private_subnet]))
  
  environment = local.environments[var.environment]
}


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

