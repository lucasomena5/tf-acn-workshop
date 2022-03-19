############################################# LUCAS OMENA #############################################

# Expressão 'for' cria um tipo de valor complexo transformando em um outro tipo de valor complexo.
# https://www.terraform.io/language/expressions/for

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