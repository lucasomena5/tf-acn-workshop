############################################# LUCAS OMENA #############################################

# HANDS-ON LABS
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

#######################################################################################################

resource "aws_instance" "ec2_linux" {
  count = var.ec2_os == "l" ? 1 : 0

  ami                  = data.aws_ami.instance_ami.image_id
  instance_type        = var.instance_type
  iam_instance_profile = var.iam_instance_profile != "" ? var.iam_instance_profile : null
  key_name             = var.key_name

  subnet_id              = data.aws_subnet.subnet.id
  vpc_security_group_ids = data.aws_security_group.sg[*].id
  associate_public_ip_address = true

  private_ip              = length(var.private_ip) > 0 ? element(var.private_ip, count.index) : null
  monitoring              = true
  tenancy                 = var.tenancy
  disable_api_termination = var.environment == "dev" ? false : true

  root_block_device {
    volume_type           = var.root_volume_type
    volume_size           = var.root_volume_size == "" ? 8 : var.root_volume_size
    iops                  = var.root_volume_type == "io1" ? var.root_iops : 0
    delete_on_termination = true
    encrypted             = true
  }

  user_data = var.user_data
  tags = {
    "Name"             = "${local.naming}",
    "Environment"      = "${local.environment}",
    "Operating System" = var.ec2_os == "w" ? "Windows" : "Linux"
  }
  volume_tags = {
    "Name"             = join("", [local.naming, "-root-volume"]),
    "Environment"      = "${local.environment}",
    "Operating System" = var.ec2_os == "w" ? "Windows" : "Linux"
  }

  depends_on = [
    data.aws_ami.instance_ami,
    data.aws_vpc.vpc,
    data.aws_subnet.subnet,
    data.aws_security_group.sg
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

