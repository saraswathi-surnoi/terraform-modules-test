variable "ami_id" {}
variable "key_name" {
  description = "Existing AWS key pair name to use for EC2 instances"
  type        = string
  default     = "devops"
}
data "aws_key_pair" "selected" {
  key_name = var.key_name
}
locals {
  key_pair_exists = length(data.aws_key_pair.selected.id) > 0
}
output "key_pair_name" {
  value = data.aws_key_pair.selected.key_name
}
variable "subnet_id" {}
variable "vpc_id" {}
variable "jenkins_master_sg" {}
variable "backend_sg" {}
variable "aiml_sg" {}
