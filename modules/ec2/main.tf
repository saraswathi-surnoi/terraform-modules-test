# Jenkins Master
resource "aws_instance" "jenkins_master" {
  ami                    = var.ami_id
  instance_type          = "t3a.medium"
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.jenkins_master_sg]
  user_data              = file("${path.module}/../user-data/jenkins_master_setup.sh")
  root_block_device {
    volume_size = 30
  }
 
  tags = {
    Name = "jenkins-master"
  }
}
 
# Backend Slaves
resource "aws_instance" "backend_slaves" {
  count                  = 2
  ami                    = var.ami_id
  instance_type          = "t3a.medium"
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.backend_sg]
  user_data              = file("${path.module}/../user-data/setup_env.sh")
 
  root_block_device {
    volume_size = 30
  }
 
  tags = {
    Name = "backend-slave-${count.index + 1}"
  }
}
 
# AIML Slave
resource "aws_instance" "aiml_slave" {
  ami                    = var.ami_id
  instance_type          = "g4dn.xlarge"
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.aiml_sg]
  user_data              = file("${path.module}/../user-data/aiml_setup_env.sh")
 
  root_block_device {
    volume_size = 50
  }
 
  tags = {
    Name = "aiml-slave"
  }
}
# /etc/hosts configuration for private IPs
resource "null_resource" "private_ip_sync" {
  depends_on = [
    aws_instance.jenkins_master,
    aws_instance.backend_slaves,
    aws_instance.aiml_slave
  ]
  provisioner "local-exec" {
    command = <<EOT
cat <<EOF > private_ips.txt
JENKINS_MASTER_IP=${aws_instance.jenkins_master.private_ip}
BACKEND_1_IP=${aws_instance.backend_slaves[0].private_ip}
BACKEND_2_IP=${aws_instance.backend_slaves[1].private_ip}
AIML_IP=${aws_instance.aiml_slave.private_ip}
EOF
EOT
  }
}