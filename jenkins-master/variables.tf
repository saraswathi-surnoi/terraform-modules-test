variable "key_name" {
  description = "Name of the key pair used for EC2 instances"
  type        = string
  default     = "fusioniq-key"
}

variable "public_key_path" {
  description = "Path to the public key file used to create the key pair"
  type        = string
  default     = "/home/ubuntu/.ssh/id_rsa.pub"
}

