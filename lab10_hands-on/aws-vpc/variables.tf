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
    condition     = contains(["dev", "pre", "pro"], var.environment)
    error_message = "The current support values are dev, pre or pro."
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