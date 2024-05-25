output "security_group_id" {
    description = "This prints the ID for sg"
    value = aws_security_group.web.id
}
