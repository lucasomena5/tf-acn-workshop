############################################# LUCAS OMENA #############################################

# HANDS-ON LABS
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

#######################################################################################################

// PRIVATE SUBNET
resource "aws_subnet" "private_subnet" {
  count             = length(local.range_private_subnet)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 8, local.range_private_subnet[count.index])
  availability_zone = data.aws_availability_zones.azs.names[local.range_private_subnet[count.index] == 51 ? 1 : 0]

  tags = {
    "Name"        = join("-", [var.prefix, join("", ["subnet", "private", format("%02d", sum([count.index, 1])), var.environment])]),
    "Environment" = "${local.environment}"
  }
}