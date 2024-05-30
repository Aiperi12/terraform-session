data "aws_ami" "amazon_linux_2023" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.4.20240513.0-kernel-6.1-x86_64"]
  }

// Semantic Versioning
// Major. Minor. Patch


  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
}
}

data "template_file" "userdata" {
    template = file("userdata.sh")
    vars = {
        env = var.env
    }
  
}