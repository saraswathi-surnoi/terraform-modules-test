output "jenkins_master_private_ip" {
  value = aws_instance.jenkins_master.private_ip
}
 
output "backend_private_ips" {
  value = [for instance in aws_instance.backend_slaves : instance.private_ip]
}
output "aiml_private_ip" {
  value = aws_instance.aiml_slave.private_ip
}