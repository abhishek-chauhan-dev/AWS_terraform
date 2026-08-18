output "display_ingress_rules" {
  value = aws_security_group.tuesday
}

output "display_instance_ids" {
  value = aws_instance.example[*].id
}