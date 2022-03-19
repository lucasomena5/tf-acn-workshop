############################################# LUCAS OMENA #############################################

# Terraform inclui diversas built-in functions que podem ser chamadas dentro de uma expressão 
# para transformar e combinar valores. 
# https://www.terraform.io/language/functions

## Numeric Functions
## String Functions
## Collection Functions
## Encoding Functions
## Filesystem Functions
## Date and Time Functions
## Hash and Crypto Functions
## IP Network Functions
## Type Conversion Functions

#######################################################################################################

data "aws_vpc" "vpc" {
  id = var.vpc_id
}

# <block_type> "<label>" "<name_label>"
resource "aws_subnet" "se_subnet" {
  vpc_id = data.aws_vpc.vpc.id
  // CIDR BLOCK - 
  cidr_block = cidrsubnet("10.1.0.0/20", 4, 2) 

  tags = merge(var.standard_tags, var.cost_tags)
}