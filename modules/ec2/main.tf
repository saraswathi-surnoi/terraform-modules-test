# Jenkins Master EC2
resource "aws_instance" "jenkins_master" {
  ami                    = var.ami_id
  instance_type          = "t3.medium"
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.jenkins_master_sg]

  tags = {
    Name = "jenkins-master"
  }
}

# Backend EC2
resource "aws_instance" "backend" {
  count                  = 2
  ami                    = var.ami_id
  instance_type          = "t3.medium"
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.backend_sg]

  tags = {
    Name = "backend-${count.index + 1}"
  }
}

# AI/ML EC2
resource "aws_instance" "aiml" {
  ami                    = var.ami_id
  instance_type          = "t3.medium"
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.aiml_sg]

  tags = {
    Name = "aiml"
  }
}
