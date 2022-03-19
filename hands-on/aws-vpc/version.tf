############################################# LUCAS OMENA #############################################

# HANDS-ON LABS
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

#######################################################################################################

terraform {

  backend "s3" {
    role_arn = ""
    bucket  = "terraform-backend-<aws-account-id>"
    region  = "eu-west-1"
    key     = "TERRAFORM/lucas-omena/vpc.tfstate"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.50.0"
    }
  }
  required_version = ">= 0.15"
}