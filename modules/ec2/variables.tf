variable "ami_id" {
  type        = string
  description = "AMI ID for the EC2 instances"
}
variable "subnet_id" {
  type        = string
  description = "Subnet ID to launch EC2 instances in"
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
  default = "fusioniq-key"
}