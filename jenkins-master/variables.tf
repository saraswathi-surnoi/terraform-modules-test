variable "key_name" {
  description = "Key pair name for EC2 instances. Terraform will create it if it doesn't exist."
  type        = string
  default     = "fusioniq"
}

variable "public_key_path" {
  description = "Absolute path to your local public key to create the key pair"
  type        = string
  default     = "/home/ubuntu/.ssh/id_rsa.pub"  # replace if different
}

