resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux_2023.image_id // Data type is String, use "", Hard Code
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.web.id]   // Dynamic   // ids = are plural, and expect an [] like list
  user_data = data.template_file.userdata.rendered      // Get an output of the file

  tags = {
    Name = "${var.env}-instance"            // dev-instance
    Name1 = format("%s-instance", var.env)  // dev-instance
    Environment = var.env
  }
}


// Data Sources fetch the data from Pre-existing resources
// Data source will fetch AMI ID from Pre-existing AMI

// How to reference to Data source?
// Syntax: data.aws_ami.amazon_linux_2023.id

// How to reference to Resource?
// Syntax: aws_ami.amazon_linux_2023.image_id