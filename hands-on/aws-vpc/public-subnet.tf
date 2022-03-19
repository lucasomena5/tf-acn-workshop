############################################# LUCAS OMENA #############################################

# HANDS-ON LABS
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

#######################################################################################################

// PUBLIC SUBNET
resource "aws_subnet" "public_subnet" {
  count                   = length(local.range_public_subnet)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = cidrsubnet(aws_vpc.vpc.cidr_block, 8, local.range_public_subnet[count.index])
  availability_zone_id    = data.aws_availability_zones.azs.zone_ids[local.range_private_subnet[count.index] == 1 ? 1 : 0]
  map_public_ip_on_launch = var.assign_public_ip
  tags = {
    "Name"        = join("-", [var.prefix, join("", ["subnet", "public", format("%02d", sum([count.index, 1])), var.environment])]),
    "Environment" = "${local.environment}"
  }
}
