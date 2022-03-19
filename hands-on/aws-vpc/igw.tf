############################################# LUCAS OMENA #############################################

# HANDS-ON LABS
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

#######################################################################################################

// INTERNET GATEWAY
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name"        = join("-", [var.prefix, join("", ["igw", format("%02d", var.sequence), var.environment])]),
    "Environment" = "${local.environment}"
  }

  depends_on = [
    aws_vpc.vpc
  ]
}