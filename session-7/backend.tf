terraform {
  backend "s3" {
    bucket = "terraform-session-bucket"
    key = "session-7/terraform.tfstate"   
    region = "us-west-2"
     }
}