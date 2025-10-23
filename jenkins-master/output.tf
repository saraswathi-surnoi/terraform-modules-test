output "jenkins_master_private_ip" {
  value = module.ec2.jenkins_master_private_ip
}

output "backend_private_ips" {
  value = module.ec2.backend_private_ips
}

output "aiml_private_ip" {
  value = module.ec2.aiml_private_ip
}
