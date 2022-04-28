// AWS ACCOUNT VARIABLES
region                  = "us-east-1"
role_arn                = ""

// NETWORKING
vpc_id             = ""
subnet_id          = ""
security_group_ids = ""

// EBS 
root_volume_type = ""
root_volume_size = 1
ebs_block_device = [{
  device_name = "/dev/sdf"
  volume_type = "gp3"
  volume_size = 10 // IOPS MAX = 50 IOPS x GB
  iops = 500
}]
kms_key_arn = ""

// EC2
iam_instance_profile = ""
instance_type        = ""
ami                  = ""
ami_owner            = ""
private_ip           = [""]
key_name             = ""
ec2_os               = "l"

// WINDOWS USER DATA
# user_data = <<EOF
#   Invoke-WebRequest https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/windows_amd64/AmazonSSMAgentSetup.exe -OutFile $env:USERPROFILE\Desktop\SSMAgent_latest.exe
#   Start-Process -FilePath $env:USERPROFILE\Desktop\SSMAgent_latest.exe -ArgumentList "/S"
#   rm -Force $env:USERPROFILE\Desktop\SSMAgent_latest.exe
#   Restart-Service AmazonSSMAgent
# EOF

// LINUX USER DATA
# user_data = <<EOF
#  sudo yum install -y https://s3.region.amazonaws.com/amazon-ssm-region/latest/linux_amd64/amazon-ssm-agent.rpm
#  sudo systemctl status amazon-ssm-agent
#  sudo systemctl enable amazon-ssm-agent
#  sudo systemctl start amazon-ssm-agent
#  sudo systemctl status amazon-ssm-agent
#EOF

// TAGGING
prefix      = "tf"
environment = "dev"
sequence    = 1