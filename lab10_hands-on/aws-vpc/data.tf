############################################# LUCAS OMENA #############################################

# HANDS-ON LABS
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

#######################################################################################################

// DATA
data "aws_availability_zones" "azs" {
  state = "available"
}

data "aws_caller_identity" "current" {}

data "aws_vpc_dhcp_options" "default" {
  dhcp_options_id = "dopt-09535a0f03413a275"
}
