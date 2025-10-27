provider "aws" {
  region = "ap-south-1"
}

# VPC and Subnet Data Sources
data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default_vpc_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

locals {
  subnet_id = data.aws_subnets.default_vpc_subnets.ids[0]
}

# Fetch Custom AMI
data "aws_ami" "surnoi_ubuntu" {
  most_recent = true
  owners      = ["361769585646"]

  filter {
    name   = "image-id"
    values = ["ami-040c28bdc0abf80a8"]
  }
}

# Security Groups
module "sg" {
  source = "../modules/security-group"
  vpc_id = data.aws_vpc.default.id
}

# EC2 Instances
module "ec2" {
  source            = "../modules/ec2"
  ami_id            = data.aws_ami.surnoi_ubuntu.id
  key_name          = aws_key_pair.fusioniq.key_name  # ✅ fixed
  subnet_id         = local.subnet_id
  vpc_id            = data.aws_vpc.default.id
  jenkins_master_sg = module.sg.jenkins_master_sg_id
  backend_sg        = module.sg.backend_sg_id
  aiml_sg           = module.sg.aiml_sg_id
}
