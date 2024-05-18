resource "aws_instance" "web" {
  count = 3
  ami           = "ami-01cd4de4363ab6ee8"   // Data type is String, use "", Hard Code
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web.id]   // Dynamic   // ids = are plural, and expect an [] like list

  tags = {
    Name = "${var.env}-instance"
    Environment = var.env
  }
}


// How to reference to resource?
// In oreder to reference ro resource,  we use labels (first and second)
// Syntax: first_label.second_label.attribute


// How to reference to input variable?
// syntax: var.variable_name
// " " - is string, code is hard coding


# Terraform Version:
# 0.0.0 - 0.11.9 = ${aws_security_group.web.id}, $ {var.env}
# 0.12.0 - 1.8.5 = aws_security_group.web.id, var.env

# Count  = meta argument, to create identical resources 
# index = 0, 1, 2, 3, 4
# indices = plural of index (indexes)

# [banana, apple, grape, orange]
# banana = 0
# apple = 1
# grape = 2
# orange = 3

# [1,2,5,6,7,8,54,56,76]
# 56 = 7
# 2 = 1
# 7 = 4