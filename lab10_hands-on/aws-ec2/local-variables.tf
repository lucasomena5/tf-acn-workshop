############################################# LUCAS OMENA #############################################

# HANDS-ON LABS
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

#######################################################################################################

// LOCAL VARIABLES
locals {
  ec2_name = join("-", [var.prefix, join("", [var.environment, format("%01d", var.number_of_sequence)])])
  environments = {
    "dev"     = "DEV"
    "pre"     = "PRE"
    "pro"     = "PRD"
    "network" = "NETWORK"
    "shared"  = "SHAREDSERVICES"
  }

  environment = local.environments[var.environment]
}