############################################# LUCAS OMENA #############################################

# HANDS-ON LABS
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

# VPC

#######################################################################################################

// AWS ACCOUNT
variable "region" {
  type        = string
  description = "(Required) AWS Region."
  default     = "us-east-1"
}

variable "role_arn" {
  type        = string
  description = "(Required) AWS Role configured."
}

// TAGGING
variable "prefix" {
  type        = string
  description = "(Optional) Terraform prefix code used for Naming. (3 characters)."
  default     = "tf"
  validation {
    condition     = contains(["tf"], var.prefix)
    error_message = "The current support value is tf."
  }
}

variable "environment" {
  description = "(Required). Terraform environment code used for Naming. (3 characters)."
  type        = string
  validation {
    condition     = contains(["shared", "network", "dev", "pre", "pro"], var.environment)
    error_message = "The current support values are shared, network, dev, pre or pro."
  }
}

variable "number_of_sequence" {
  description = "(Required) number_of_sequence number of the resource. If you have more than one resource, send the number_of_sequence accordingly so that names dont clash."
  type        = number
}

// VPC
variable "vpc_cidr_block" {
  type        = string
  description = "(Required) AWS VPC CIDR Block."
}

variable "enable_dns_support" {
  type        = bool
  description = "(Required) Enable DNS Support."
  default     = true
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "(Required) Enable DNS Hostnames."
  default     = true
}

// NAT GATEWAY
variable "connectivity_type" {
  type        = string
  description = "(Required) Connectivity Type for NAT Gateway"
  default     = "public"
  validation {
    condition     = contains(["private", "public"], var.connectivity_type)
    error_message = "The current support values are private and public."
  }
}

// SUBNETS
variable "assign_public_ip" {
  type        = bool
  description = "(Required) Assigning a Public IP address."
  default     = true
}

variable "qtd_public_subnet" {
  description = "(Required) Quantity of subnets."
  type        = number
  default     = 1
}

variable "qtd_private_subnet" {
  description = "(Required) Quantity of subnets."
  type        = number
  default     = 1
}

############################################# LUCAS OMENA #############################################

# HANDS-ON LABS
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

# EC2

#######################################################################################################


// AWS ACCOUNT
variable "region" {
  type        = string
  description = "(Required) AWS Region."
  default     = "us-east-1"
}

variable "role_arn" {
  description = "(Required) AWS Role configured."
  type        = string
}

variable "ami_owner" {
  description = "(Required) Owner of the ami, or an AWS owner alias (e.g. amazon, aws-marketplace, microsoft)."
  type        = string
}

variable "ami" {
  description = "(Required) AMI create Terraform"
  type        = string
}

// SUBNET
variable "vpc_id" {
  description = "(Required) The VPC where the instance is going to be launched in"
  type        = string
}

variable "subnet_id" {
  description = "(Required) The VPC Subnet ID to launch in"
  type        = string
}

variable "availability_zone" {
  description = "(Optional) The availability zone where the instance is going to be launched in"
  type        = string
  default     = null
}

// SECURITY GROUPS
variable "security_group_ids" {
  description = "(Required) The security groups ID to launch in"
  type        = list(string)
}

// RESOURCE AWS INSTANCE WINDOWS
variable "instance_type" {
  description = "(Required) AMI created Terraform"
  type        = string
}

variable "iam_instance_profile" {
  description = "(Optional) Friendly IAM role name that the ec2 instance is going to have."
  type        = string
  default     = ""
}


variable "private_ip" {
  description = "(Optional) A list of private IP address to associate with the instance in a VPC. Should match the number of instances."
  type        = list(string)
  default     = [""]
}

variable "tenancy" {
  description = "(Required) Type of tenancy. Values: dedicated, host or default (dedicated host)."
  type        = string
  default     = "default"
}


variable "ec2_os" {
  description = "(Required) Specify if it's Windows or Linux"
  type        = string
  validation {
    condition     = contains(["w", "l"], var.ec2_os)
    error_message = "The current support values are w (Windows) and l (Linux)."
  }
}

// KEYS FOR WINDOWS AND LINUX INSTANCE
variable "get_password_data" {
  description = "(Required) If true, wait for password data to become available and retrieve it."
  type        = bool
  default     = false
}

variable "key_name" {
  description = "(Required) The key name to access for the instance"
  type        = string
}

// VOLUME ROOT BLOCK DEVICE FOR EC2
variable "root_volume_type" {
  description = "(Required) The root volume type of the EC2 root device. Can be standard, gp3, io1."
  type        = string
  validation {
    condition     = contains(["standard", "gp3", "io1"], var.root_volume_type)
    error_message = "The current support values are standard, gp3, and io1."
  }
}

variable "root_volume_size" {
  description = "(Optional) The root volume size of the EC2 root device in GiB."
  type        = number
  default     = 8
}

variable "root_iops" {
  description = "(Optional) The root volume iops of the EC2 root device. Only valid for volume_type of io1."
  type        = number
  default     = null
}

// EBS
variable "ebs_block_device" {
  description = <<EOF
  (Optional) Additional EBS block devices to attach to the instance e.g
   ebs_block_device = [
    {
      device_name = "/dev/sdf"
      volume_type = "gp2"
      volume_size = 20
      // IOPS MAX = 50 IOPS x GB
      iops=  1000
    },
    {
      device_name = "/dev/sdj"
      volume_type = "gp2"
      volume_size = 2
      // IOPS MAX = 50 IOPS x GB
      iops=  1000
    }]
  EOF
  default     = []
}

variable "user_data" {
  description = "(Optional) The user data to provide when launching the instance"
  type        = string
  default     = null
}

// TAGGING
variable "prefix" {
  description = "(Required) Terraform prefix code used for Naming. (3 characters) "
  type        = string
  validation {
    condition     = contains(["tf"], var.prefix)
    error_message = "The current support value is inf."
  }
}

variable "environment" {
  description = "(Required) Terraform environment code used for Naming. (3 characters) "
  type        = string
  validation {
    condition     = contains(["network", "shared", "dev", "pre", "pro"], var.environment)
    error_message = "The current support values are network, shared, dev, pre or pro."
  }
}

variable "number_of_sequence" {
  description = "(Required) number_of_sequence number of the resource used for Naming."
  type        = number
  default     = 1
}
