provider "aws" {
  region = "ap-south-1"
}

# Fetch default VPC
data "aws_vpc" "default" {
  default = true
}
# Fetch all default subnets
data "aws_subnet_ids" "default_vpc_subnets" {
  vpc_id = data.aws_vpc.default.id
}
locals {
  default_subnet_id = data.aws_subnet_ids.default_vpc_subnets.ids[0]
}
 
# Fetch latest Amazon Linux 2 AMI
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
 
# Security Group Module
module "sg" {
  source = "../modules/security-group"
  vpc_id = data.aws_vpc.default.id
}
 
# EC2 Module
module "ec2" {
  source            = "../modules/ec2"
  ami_id            = data.aws_ami.amazon_linux.id
  key_name          = "devops"  # Replace with your key pair
  subnet_id         = local.default_subnet_id
  vpc_id            = data.aws_vpc.default.id
  jenkins_master_sg = module.sg.jenkins_master_sg_id
  backend_sg        = module.sg.backend_sg_id
  aiml_sg           = module.sg.aiml_sg_id
}