terraform {
  backend "s3" {
    bucket = "terraform-session-bucket"
    key = "vpc/terraform.tfstate"   // Path to your remote backend file (terraform.tfstate)
    region = "us-west-2"
     }
}