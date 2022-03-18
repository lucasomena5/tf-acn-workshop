############################################# LUCAS OMENA #############################################

# Data Sources permite um dado ser buscado ou computado para uso em qualquer referência dentro das 
# configurações do Terraform.
# https://www.terraform.io/language/data-sources

#######################################################################################################

data "aws_vpc" "vpc" {
  id = ""
}

# <block_type> "<label>" "<name_label>"
resource "aws_subnet" "first_subnet" {
  vpc_id = data.aws_vpc.vpc.id
  cidr_block = "10.1.10.0/24"
}