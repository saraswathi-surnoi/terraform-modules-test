provider "aws" {
  region = "ap-south-1"
}

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

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "state"
    values = ["available"]
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
  ami_id            = data.aws_ami.amazon_linux.id
  key_name          = var.key_name
  subnet_id         = local.subnet_id
  vpc_id            = data.aws_vpc.default.id
  jenkins_master_sg = module.sg.jenkins_master_sg_id
  backend_sg        = module.sg.backend_sg_id
  aiml_sg           = module.sg.aiml_sg_id
}
