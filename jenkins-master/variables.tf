variable "key_name" {
  description = "Key pair name for EC2 instances. Terraform will create it if it doesn't exist."
  type        = string
  default     = "devops"
}

variable "public_key_path" {
  description = "Path to your local public key to create the key pair"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}
