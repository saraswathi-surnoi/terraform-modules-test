output "jenkins_master_sg_id" {
  value = aws_security_group.jenkins_master_sg.id
}

output "backend_sg_id" {
  value = aws_security_group.backend_sg.id
}

output "aiml_sg_id" {
  value = aws_security_group.aiml_sg.id
}
