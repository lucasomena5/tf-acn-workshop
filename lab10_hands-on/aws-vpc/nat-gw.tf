############################################# LUCAS OMENA #############################################

# HANDS-ON LABS
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

#######################################################################################################

// NAT GATEWAY
resource "aws_eip" "eip" {
  vpc = true

  depends_on = [
    aws_internet_gateway.igw
  ]
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id     = aws_eip.eip.id
  connectivity_type = var.connectivity_type
  subnet_id         = aws_subnet.public_subnet[0].id

  tags = {
    "Name"        = join("-", [var.prefix, join("", ["ngw", format("%02d", var.number_of_sequence), var.environment])]),
    "Environment" = "${local.environment}"
  }

  depends_on = [
    aws_internet_gateway.igw
  ]
}