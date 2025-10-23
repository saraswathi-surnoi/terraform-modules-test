# Security group for Jenkins Master
resource "aws_security_group" "jenkins_master_sg" {
  name        = "jenkins_master_sg"
  description = "Security group for Jenkins Master"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security group for Backend
resource "aws_security_group" "backend_sg" {
  name        = "backend_sg"
  description = "Security group for Backend"
  vpc_id      = var.vpc_id
}

# Security group for AI/ML
resource "aws_security_group" "aiml_sg" {
  name        = "aiml_sg"
  description = "Security group for AI/ML"
  vpc_id      = var.vpc_id
}