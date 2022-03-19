############################################# LUCAS OMENA #############################################

# HANDS-ON LABS
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

#######################################################################################################

resource "aws_ebs_volume" "ebs_windows" {
  count = var.ec2_os == "w" ? length(var.ebs_block_device) : 0

  availability_zone = join("", data.aws_instance.instance_windows[*].availability_zone)
  iops              = var.ebs_block_device[count.index].volume_type == "io1" ? var.ebs_block_device[count.index].iops : null
  size              = var.ebs_block_device[count.index].volume_size
  type              = var.ebs_block_device[count.index].volume_type
  encrypted         = true
  #kms_key_id        = var.kms_key_arn
  lifecycle {
    ignore_changes = [
      availability_zone
    ]
  }
  tags = {
    "Name"        = join("", [local.naming, "-ebs"]),
    "Environment" = "${local.environment}"
  }

  depends_on = [
    data.aws_instance.instance_windows,
    #data.aws_kms_key.kms_key
  ]
}