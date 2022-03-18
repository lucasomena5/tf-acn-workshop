############################################# LUCAS OMENA #############################################

# Terraform Resource é um bloco que descreve um ou mais objetos de infraestrutura ou componentes 
# em alto nível como por exemplo VPC, VNET, EC2, RDS etc.
# https://www.terraform.io/language/resources

#######################################################################################################
# <block_type> "<label>" "<name_label>"
resource "aws_vpc" "first_vpc" {
#    <key>        <value>  
  cidr_block = "10.1.0.0/20"
}