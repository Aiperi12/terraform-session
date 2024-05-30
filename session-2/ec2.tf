resource "aws_instance" "web" {
  ami           = "ami-01cd4de4363ab6ee8"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-session-instance"
  }
}

#  There 2 main blocks in Terraform
#  1. Resource block = create and manage resources (AWS serivces or infrastructure)
#     - Resource block expects 2 labels
#  2. Data source block = Data Sources fetch the data from Pre-existing resources
#     Data source will fetch AMI ID from Pre-existing AMI
#     - Syntax: data "first_label" "second_label"

// Syntax:
// resource = block 
// aws_instance = first_label, (resource type), predefined by Terraform 
// web = second_label, (logical name or logical id of terraform block), defined by Author
// ami = argument, (consist of Key/Value, Name/Value), configurations of the resource
   // - Key = predefined by Terraform
   // - Value = defined by Author

// Working directory 
//  - Place where you run Terraform Commands
//  - Place where you have Terraform Configurations Files
//  - (Root Module)   


// Terraform has Backend (terraform.tfstate)
   // - Local Backend = gets generated in the same working directory
   // - Remote Backend = gets generated in the remote system such s3 bucket

// what is in the Backend?
// - Stores your Infrastructure Information
// - Shows the desired state of your Infrastructure   