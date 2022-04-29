############################################# LUCAS OMENA #############################################

# HANDS-ON LABS
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

#######################################################################################################

// ROUTE TABLES
resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    "Name"        = join("-", [var.prefix, join("", ["rt", "public", format("%02d", var.number_of_sequence), var.environment])]),
    "Environment" = "${local.environment}"
  }
}

resource "aws_route_table" "rt_private" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    "Name"        = join("-", [var.prefix, join("", ["rt", "private", format("%02d", var.number_of_sequence), var.environment])]),
    "Environment" = "${local.environment}"
  }
}

// PUBLIC ASSOCIATION
resource "aws_route_table_association" "rt_public_association" {
  count          = length(aws_subnet.public_subnet)
  route_table_id = aws_route_table.rt_public.id
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
}

// PRIVATE ASSOCIATION
resource "aws_route_table_association" "rt_private_association" {
  count          = length(aws_subnet.private_subnet)
  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = aws_route_table.rt_private.id
}

// INTERNET ROUTE ASSOCIATION
resource "aws_route" "internet_route" {
  route_table_id         = aws_route_table.rt_public.id
  gateway_id             = aws_internet_gateway.igw.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route" "nat_route" {
  route_table_id         = aws_route_table.rt_private.id
  gateway_id             = aws_nat_gateway.nat_gateway.id
  destination_cidr_block = "0.0.0.0/0"
}
