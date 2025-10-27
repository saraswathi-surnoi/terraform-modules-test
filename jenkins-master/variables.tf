variable "key_name" {
  description = "Key pair name for EC2 instances"
  type        = string
  default     = "fusioniq-key"
}

variable "public_key_path" {
  description = "Path to your SSH public key file"
  type        = string
  default     = "/home/ubuntu/.ssh/id_rsa.pub"
}
