// 2 security groups (ALB, EC2 instances)

resource "aws_security_group" "EC2" {
  name        = replace(local.name, "rtype", "ec2-sg")
  description = "This is security group for EC2 instances"
  vpc_id = aws_default_vpc.main.id
  tags = merge (
       { Name = replace(local.name, "rtype", "dec2-sg")} ,
        local.common_tags
    )

    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

    dynamic "ingress" {
    for_each = var.ec2_ports
    iterator = dynamic
    content {
      from_port = dynamic.value.port
      to_port = dynamic.value.port
      protocol = dynamic.value.protocol
      security_groups = [aws_security_group.alb.id]
    }
 }
}


resource "aws_security_group" "alb" {
  name        = replace(local.name, "rtype", "alb-sg")
  description = "This is security group for alb instances"
  vpc_id = aws_default_vpc.main.id
  tags = merge (
       { Name = replace(local.name, "rtype", "alb-sg")} ,
        local.common_tags
    )

    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

    dynamic "ingress" {
    for_each = var.alb_ports
    iterator = dynamic
    content {
      from_port = dynamic.value.port
      to_port = dynamic.value.port
      protocol = dynamic.value.protocol
      cidr_blocks = ["0.0.0.0/0"]
    }
 }
}


