// AWS ACCOUNT VARIABLES
region                  = "us-east-1"
role_arn                = ""

// RAM PRINCIPAL
receiver_principal = ""

// TAGGING
prefix      = "tf"
environment = "network"
sequence    = 1

// NETWORKING
vpc_cidr_block       = "10.1.0.0/20"
enable_dns_hostnames = true
enable_dns_support   = true
domain_name          = "tfworkshop.com"

// NAT GATEWAY
connectivity_type = "public"

// SUBNET
assign_public_ip = true

web_ports = {
  https = 443
  http  = 80
  ssh   = 22
}

database_ports = {
  oracle = 1521
}