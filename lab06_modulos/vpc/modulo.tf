############################################# LUCAS OMENA #############################################

# Terraform Modules são os principais métodos para empacotar e reusar configuração no Terraform.

# Há dois tipos de Terraform Module:

## Root Module:
### A configuração do Terraform tem pelo menos um módulo que consiste em um recurso definido no arquivo .tf  
## Child Modules:
### Um módulo pode ser chamado por outros para incluir os recursos deles na configuração.

# https://www.terraform.io/language/modules

#######################################################################################################

module "networking" {
  source = "."
  # major.minor[.build[.revision]] (example: 1.2.12)
  version = "1.0.0"
  
  // PROVIDER
  assume_role = var.assume_role
  role_arn = var.role_arn

  // NETWORKING
  vpc_id = var.vpc_id
  subnet_cidr_block = var.subnet_cidr_block
  
  // TAGS
  standard_tags = var.standard_tags
  cost_tags = var.cost_tags
}