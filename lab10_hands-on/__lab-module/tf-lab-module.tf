############################################# LUCAS OMENA #############################################

# HANDS-ON LABS
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

#######################################################################################################

module "tf-infra-vpc" {
    source = "../aws-vpc"
}

module "tf-infra-ec2" {
    source = "../aws-ec2"
}