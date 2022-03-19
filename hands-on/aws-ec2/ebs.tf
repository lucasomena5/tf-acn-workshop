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

resource "aws_ebs_volume" "ebs_linux" {
  count = var.ec2_os == "l" ? length(var.ebs_block_device) : 0

  availability_zone = join("", data.aws_instance.instance_linux[*].availability_zone)
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
    data.aws_instance.instance_linux,
    #data.aws_kms_key.kms_key
  ]
}

//Windows EBS
resource "aws_volume_attachment" "attachment_windows" {
  count = var.ec2_os == "w" ? length(var.ebs_block_device) : 0

  device_name = var.ebs_block_device[count.index].device_name
  volume_id   = aws_ebs_volume.ebs_windows[count.index].id
  instance_id = join("", aws_instance.ec2_windows[*].id)
  lifecycle {
    ignore_changes = [
      instance_id, volume_id
    ]
  }

  depends_on = [
    data.aws_instance.instance_windows,
    aws_ebs_volume.ebs_windows
  ]
}

resource "aws_volume_attachment" "attachment_linux" {
  count = var.ec2_os == "l" ? length(var.ebs_block_device) : 0

  device_name = var.ebs_block_device[count.index].device_name
  volume_id   = aws_ebs_volume.ebs_linux[count.index].id
  instance_id = join("", aws_instance.ec2_linux[*].id)
  lifecycle {
    ignore_changes = [
      instance_id, volume_id
    ]
  }

  depends_on = [
    data.aws_instance.instance_linux,
    aws_ebs_volume.ebs_linux
  ]
}