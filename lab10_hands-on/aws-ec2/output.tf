############################################# LUCAS OMENA #############################################

# HANDS-ON LABS
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

#######################################################################################################

output "ec2_id" {
  description = "ID of the EC2 instance created"
  value       = var.ec2_os == "w" ? aws_instance.ec2_windows[0].id : aws_instance.ec2_linux[0].id
}

output "ec2_arn" {
  description = "ARN of the EC2 instance created"
  value       = var.ec2_os == "w" ? aws_instance.ec2_windows[0].arn : aws_instance.ec2_linux[0].arn
}

output "ec2_ip_address" {
  description = "IP Address of the EC2 instance created"
  value       = var.ec2_os == "w" ? aws_instance.ec2_windows[0].private_dns : aws_instance.ec2_linux[0].private_dns
}