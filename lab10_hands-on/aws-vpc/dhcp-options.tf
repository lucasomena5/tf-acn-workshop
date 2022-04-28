############################################# LUCAS OMENA #############################################

# HANDS-ON LABS
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

#######################################################################################################

// DCHP OPTIONS
resource "aws_vpc_dhcp_options_association" "default_dhcp_options_sets" {
  vpc_id          = aws_vpc.vpc.id
  dhcp_options_id = data.aws_vpc_dhcp_options.default.id
}