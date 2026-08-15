output "instance_id" {
    description = "ID of the EC2 instance"
    value = aws_instance.demo_instance.id
}

output "instance_public_ip" {
    description = "Public IP of the EC2 instance"
    value = aws_instance.demo_instance.public_ip
}

output "instance_private_ip" {
    description = "Private IP of the EC2 instance"
    value = aws_instance.demo_instance.private_ip
}