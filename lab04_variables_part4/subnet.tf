############################################# LUCAS OMENA #############################################

# Um valor local pode ser usada múltiplas vezes dentro de um mesmo módulo
# https://www.terraform.io/language/values/locals

#######################################################################################################
locals {
  subnet_tag = join("-", ["tf", "subnet", "01"])

  environments = {
    "dev"     = "DEV"
    "pre"     = "PRE"
    "pro"     = "PRD"
  }

  environment = local.environments[var.environment]
}

data "aws_vpc" "vpc" {
  id = var.vpc_id
}

# <block_type> "<label>" "<name_label>"
resource "aws_subnet" "se_subnet" {
  vpc_id = data.aws_vpc.vpc.id
  cidr_block = "10.1.20.0/24"

  tags = {
    "Name" = local.subnet_tag
    "Environment" = local.environment
  }
}