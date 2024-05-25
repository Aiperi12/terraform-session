resource "aws_instance" "web" {
  ami           = var.ami   // Data type is String, use "", Hard Code
  instance_type = var.instance_type
  vpc_security_group_ids =  var.sg
  tags = {
    Name = "${var.env}-instance"
    Environment = var.env
  }
}
