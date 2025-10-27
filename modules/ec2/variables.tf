variable "ami_id" {
  type        = string
  description = "AMI ID for EC2 instances"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for EC2 instances"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "jenkins_master_sg" {
  type        = string
  description = "SG ID for Jenkins Master"
}

variable "backend_sg" {
  type        = string
  description = "SG ID for Backend"
}

variable "aiml_sg" {
  type        = string
  description = "SG ID for AI/ML"
}
variable "key_name" {
  description = "Key pair name for EC2 instances"
  type        = string
}