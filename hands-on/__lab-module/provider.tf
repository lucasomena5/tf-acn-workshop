############################################# LUCAS OMENA #############################################

# HANDS-ON LABS
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

#######################################################################################################

// PROVIDER
provider "aws" {
  region = var.region
  assume_role {
    role_arn = var.role_arn
  }

  default_tags {
    tags = {
      "Project"   = "WORKSHOP TERRAFORM"
      "ManagedBy" = "<EID>"
    }
  }
}
